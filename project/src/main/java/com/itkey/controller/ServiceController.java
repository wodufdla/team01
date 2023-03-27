package com.itkey.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.w3c.dom.Element;

import com.itkey.service.ServiceService;

@Controller
public class ServiceController {
	private static final Logger log = LoggerFactory.getLogger(ServiceController.class);
	
	@Autowired
	private ServiceService serviceService;
	
	public static String getTagValue(String tag, Element element) {
		NodeList list = element.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) list.item(0);
		return nValue.getNodeValue();
	}
	  
	@RequestMapping("/safetyMap")
	public String safetyMap(Model model) {
		return "safetyMap";
	}
	
	@RequestMapping("/rtPublicStatus")
	public String rtPublicStatus(Model model) throws SAXException, IOException, ParserConfigurationException {
		
		String url = "http://api.sexoffender.go.kr/openapi/SOCitysStats/";
		
		DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
		Document doc = dBuilder.parse(url);

		// root tag 
		doc.getDocumentElement().normalize();
		//System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
		
		// 파싱할 tag
		NodeList nList = doc.getElementsByTagName("City");
		//System.out.println("파싱할 리스트 수 : "+ nList.getLength());  // 파싱할 리스트 수 : 18개
		
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		
		int total = 0;
		
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
								
				Element eElement = (Element) nNode;
				//System.out.println("######################");
				//System.out.println(eElement.getTextContent());

				String name = getTagValue("city-name", eElement);
				if (!name.equals("기타")) {
					String count = getTagValue("city-count", eElement);
					int intCount = Integer.parseInt(count);
					total += intCount;
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("name", name);
					map.put("count", count);
					
					//System.out.println("map" + map);
					list.add(map);
				}
			}	// for end
		}	// if end
		
		//System.out.println("list" + list);
		
		model.addAttribute("list", list);
		model.addAttribute("total", total);
		
		return "rtPublicStatus";
	}
	
	@RequestMapping("/howRespond")
	public String howRespond(Model model) {
		return "howRespond";
	}
}
