Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010017.outbound.protection.outlook.com [52.103.20.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC4640B109
	for <platform-driver-x86@vger.kernel.org>; Sun,  4 Oct 2026 09:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791105986; cv=fail; b=nXwlJL6Mad9QWyqU5xx3xTWNvzDgXrHZJbJ/AFz+oj9AX4KWL6B2BuKr3dNahPT7OhvAEmZ6baQJNm1wjUVWghhXgj1DFVBMsA08kFAfgRz1HOA3Tk4wQgCB1gtl3MGXsKVqwRTG9JI9/rDCRQlP/wrZg2Yw9Uq3BhkTdRcjCcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791105986; c=relaxed/simple;
	bh=sKK29KJFsSdyVi3sO5FWaWLyc6Dqv9oZft26QtYJ3lc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dVhSufjbh0xbdWHHGFrW7Kqjn6SOZew3qkn8ItzSbw1McRFn1wUP5M4W65B8Id3VGegBSrrXE4eDV85vCHVheot80r60KdJHikItcDUS/QtW8myFAWWW/bGL2T+uCA0EErpwzjTGOnLXSrjFFCXkNfk1uHH2pRNQNuPE3B11i3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eaTzbLb6; arc=fail smtp.client-ip=52.103.20.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eaTzbLb6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUSOuBGvI8IPlJFbWCCVzwz0viyNtGHx6KHOEgWB8BWJTLJOWmSqd5nQTfoH+xRUOy3FyH5A22KDDMTRWmae4G92POOt3/ua8eNsuDocKPFYazGbvjuNtjg3gGDpCyDV5081+xnBRcYHDNIIr23zbsVVNi6QLor5Rv0li5U/PV7RBtU71HOkk7eZWbGUKafbL65qlo+JJRb3EybTv9JyUmRBiI6DG4FozJ+6Gcil8PbWfycCdMmRlkliVD/1doJVnzMqlSVX2ahQZjNtO1iiJQos+Mt+dluuZZfmExtWibwviSWYRF4YwhxtjAjNvcYJ6TAkmVSq8DdJGerMLK/jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKK29KJFsSdyVi3sO5FWaWLyc6Dqv9oZft26QtYJ3lc=;
 b=Na/Hw6Uni2+PrUFDIkIO2Zeuspps4oApUQo1nKP5Zxf2ldqYegeLtvdyQSD59RU4i5pf6GVRNsS89ek4XvFWYz6wkHBSQTFiAAD1bPqVdYPFwlguYy+Jv7t1leLMyqAAXHWC1owhxX1kuJpFa3F4JoCT9EtWkSGRT4HNv8jxj/1RDVp5loBNd8e+ErrjHjh64NS+iEeFgz8lhiDf7PKsIbivnyaDAHviIDUI/3I4dSStFbK3/e0zuje48E+aczWwQ7pEa3Mdx0KU31r7NiUgRAPox7e/xojM/wuEUdD+qOQWscjez/ARfDjqIn3Fv8Yk+ChFp2OoOOSuk9N0FJSRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKK29KJFsSdyVi3sO5FWaWLyc6Dqv9oZft26QtYJ3lc=;
 b=eaTzbLb6VDB+p5Xx80jqZVVO9hFrMle35y09ltzjJkZ8iqdrDP93oszgslS4V/SG1x4mkEukowBFcDUvcgfWnu+oNMYVjMGTAFTKbJnMJ48jB3pGzamufCEHAW+2iA9Uw6vZisicbkoRi+oj6whaHVD60Y33bsSbSOJTHMSijBVAMedAK9TR1FaEJpuuvSQIdBM2V99aA1Khudylkb3SRvCXfcdGZTI+MLti5+tw7JjOIwdw7q+18BCj986/daVMrdjH7SIKmpInNrMpjI1mnm7k26PlwQrm02PM5Dh9gu6QbOjScd3go09ZEk+o3xNmUsVcXM7HSYYYTrOnO4ejDg==
Received: from BYAPR03MB3749.namprd03.prod.outlook.com (2603:10b6:a03:6b::27)
 by DS2PR03MB443231.namprd03.prod.outlook.com (2603:10b6:8:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 09:26:22 +0000
Received: from BYAPR03MB3749.namprd03.prod.outlook.com
 ([fe80::4f8b:93d2:9d5:bfae]) by BYAPR03MB3749.namprd03.prod.outlook.com
 ([fe80::4f8b:93d2:9d5:bfae%5]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 09:26:22 +0000
From: Li Lei <Kyyous@outlook.com>
To: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: [Request] platform/x86: asus-wmi: Ignore WMI events with code 0xb0
Thread-Topic: [Request] platform/x86: asus-wmi: Ignore WMI events with code
 0xb0
Thread-Index: AQHdU91q/DTZlive3Euh85eWgmsCgg==
Date: Sun, 4 Oct 2026 09:26:21 +0000
Message-ID:
 <BYAPR03MB374931A62A9E3B52D4639154EF972@BYAPR03MB3749.namprd03.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3749:EE_|DS2PR03MB443231:EE_
x-ms-office365-filtering-correlation-id: 0529fbb1-ae02-4691-7a97-08df21f98dcf
x-microsoft-antispam:
 BCL:0;ARA:14566002|39105399006|31061999003|25010399006|4140399003|19110799012|8062599012|8060799015|15080799012|15030799006|24021099003|41001999006|20031999006|2607281247196008|440099028|3412199025|102099032|40105399003|23121099006|10035399007;
x-microsoft-antispam-message-info:
 =?gb2312?B?WlZaRmlndXN2cnZENTJqeW1WUGR3bnFjTVJDTWh0aU5hVzZ5Qml2dFhTQmox?=
 =?gb2312?B?aEdhUkhBYkJUb0NnZXJGaUVnbGFSYlBRalVMTTBzaGxjcWhkRzlXcytJVFZn?=
 =?gb2312?B?aDdZWGpFSDhmNTRIa0tlb2dWY0VGek1mOVU4VWU3enBwQUxUUnorcnpFUVdt?=
 =?gb2312?B?Wm44WHlQRVNLbU0vZmRIVmdqSHB4VlpwbVpETEhBcFhRWFJMZlZWZFFmdnlp?=
 =?gb2312?B?bGJheCtVd3pHZjUrei9OekxsNkN4TE5MS0ZKQ25QaDdReE80UWkrVlBEY21u?=
 =?gb2312?B?bDVaYkJrTEhzeVVLcEd3OUNtZnZac2lOSzVzdEs1ZzNia1pQa3ZQUFBvNjNH?=
 =?gb2312?B?WU5ick1VYkM3M2xsMlpiY2I4Q1Rhd01zdmRQYzl0Z1UrOGhHcWVqNGRVcUdj?=
 =?gb2312?B?Y0ZtcHJTYUc3SmY3N29QN3NUNXJNOVdUaC9HYUozMzBmRkpyY1Q5Q0xsSllZ?=
 =?gb2312?B?bjl2WThuZVkraytSenY4UW5NK1A4ekN6RHQxUzZCU0UwZGdvR21rUVF6UWdu?=
 =?gb2312?B?aGd1cHprUkRyRHRsNWpveFREdUthMDZaRk8rRXBiemJmNlZxUElqWm9NdnVt?=
 =?gb2312?B?MWVMNjFvbWlKUkFwN2hZbUN4ck5wUVdwWmlVUGVydk5HS0ZPN1UyRzhrcnMr?=
 =?gb2312?B?S0xBenFwSE16V2VlR2h3MzZHR3hFQWt6V0hiSDY1OUdGeW5KbjZQck4raW1C?=
 =?gb2312?B?UEYyZm9yK21wbUlmT25wSlZNK0FNTmMzSXJEcDJ2TDNMTk94MTM2YzYvY2s3?=
 =?gb2312?B?dGx3TmJORGh5cU1wMmpqR2RsQURFc3R3cFdiYmoxWGpqVUJBZitOWFVRZXBP?=
 =?gb2312?B?R2FNVW5tWFNIdnR4a3JZdlNvRStjeGZTNEpHVXBUNjNpalp6d1RQMGRmQTNZ?=
 =?gb2312?B?QjF0dC9TdEE2ZHVPV3dIZ2RnT3o1YUQyc25Oc1I0YXJiZE9GOWRScXpWekZa?=
 =?gb2312?B?UGlDUnV4VlRHOVQwVTQrSlR0bCtjL0U3WHRzZjBnaW1sZ0hXUzdSdHd6RjZK?=
 =?gb2312?B?ZU1TQUlIdXh3eG1GREMvYUV0dUdMVUgrWit6dGpFbndORGhwS2pWOGhUWlhE?=
 =?gb2312?B?SklZam5YQjREMHhSZVljWXcrdzBvK3V4ck1QMDlobmFQekk1N3c1K2JFVlNh?=
 =?gb2312?B?S0t5dEVKWC9nRnEzN3ZTUG41YWJRSGdtOStoVVBnU3h1Y0EvTWZ4cGFqd2ww?=
 =?gb2312?B?NGsxRVdBK1J4UXkwT2pwSWdxenduNVByOU1ISExjdzlLZjh0T0k2RzE0NEgy?=
 =?gb2312?B?dmhJRGZ5UU12c3BFUk82M1lvT0Z6UXYxR3M2TFYxNUkxbStucnVKVXYzanBx?=
 =?gb2312?B?WUNWRUZ4ak9FbnBSd2Q5UFU4TTM5M1NLanhZcUVFSDRJSHg5VWVZQ2wxdHpa?=
 =?gb2312?Q?rnGtHl7VXYFBO76Iq2nyCx8q8IUSYSgQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?VSt6ZnJjR0FOQXlEQ1NnWHRva0Y3RDhQMys2ejNsSHhkcHVqZG1tZ0dBTDRW?=
 =?gb2312?B?cUZlazJ6UmZhRGdyS1hEem9ndGxMREtDQ3YrcWdtZ0NDWDFJWWNEM2NpT0p5?=
 =?gb2312?B?elRyQ1Awc0tXZHJYdHB2K293bHN5WmlITTVhUis5NHVUbzNBaHloL2ViVVNo?=
 =?gb2312?B?dzZyYWdBcDFjTHMzZWlGSHFDcmVuWkFBOFB0c20xRTN2dFpkT0kzNlBFcUZ6?=
 =?gb2312?B?RDZhT016K3RvblVIM3hyeDIxMi90ZU9HUFZVMDFHQXZ2ZkRLanM3bjJES2Ix?=
 =?gb2312?B?NzZMa2RZZ05ZeXBtZzZXMURxVnBlTlpxd1BDSFRYRzVqYlBWZmt0NjRSVTNH?=
 =?gb2312?B?VERjQUQ0dG9lRHJ1S1EvbE1VN0pWbzJnSnorc3F4SE10UmJsQlRDSUo5L3lZ?=
 =?gb2312?B?RFhtaC9ST3RsOEY0S21YS0JMQXplczAzdzhmOEI2QjIxWEdibGppTFZDTmZC?=
 =?gb2312?B?OXcwNEZsdHhYaXNhOFl1dXZGUmZURE16SWhXMW1ybFNYSWU1alRrMjloQ2Jz?=
 =?gb2312?B?bE83L2FaSk9uVk1CQmgwZ2J1OHBxWjF4UWR0V0ZpdVN3bDRNRlNhdGdsZnh5?=
 =?gb2312?B?T0xOSkl3Yk9aZm5EalZUSVQvc3FCa1hYL2IzTm1UdkdPRUVGZ3ByT1RFdkUz?=
 =?gb2312?B?MlBWSnNGd1lMMG1yU0NqdUVINEpQVjZHWXYvY0E0Y21wUVdrTW96Q0FBRnBm?=
 =?gb2312?B?RUpwYUFMeHg5ZVNkbWVnbjk4MUMwWEg0bW56L05vM2l6czVYazRQUDVnM0Q5?=
 =?gb2312?B?VndoUFZwSDM0ZHZoK0doTDAzMDNCSkFmOUtrZEo1d21lNDFUNUM0ZE9vR3o5?=
 =?gb2312?B?NWlzUjV0aml5aXVlZ1R1WEduMmRub1h5bEozVFBmdnFhYkZTeGl2Rjlta09T?=
 =?gb2312?B?VEpQeDBWZFJZQnFKdnA4dEI3WS9CQ2JUNkoyTks5YU9RYkRMZ2pKVHdSc2JB?=
 =?gb2312?B?T2JybXF1WXRYSmdRN2dZbFlLeDRmaW40a2tPbVFBVlBkZzFVNWltZk5wQVpr?=
 =?gb2312?B?K1ZuZ0tyT0RMN09OSFpaUTc4NE92R2xKZ0thbkJaN1YwV3hSZHIyeFlVSUZX?=
 =?gb2312?B?S3FRcy9GWnZ6RlJkVUR1RU1JUDVHVDc3c280UVRJeXRaUlhDMy9WU3J3OUdR?=
 =?gb2312?B?RTFtS1lFZTUwZWl6QVJQaDlvTnlLVjFUQmMxWndqSmZlVW5IbVZUT25FZ2c4?=
 =?gb2312?B?L0EvL0JHZmVRdFNBMTFGb0owZGxaM2lma1pzY2IrMm5UUitXd3l2Y0pVSlNa?=
 =?gb2312?B?dEZMU3RJZTI0eFNDRWJqOUkyQ2MvQmErUHdJMWYyVzZRQ2VOazRpam5mUWla?=
 =?gb2312?B?UFFzZDdJU254WmxxT2J1OXFxS3F3Uk1tZ1VzNGlhREFLblFHOTM5NzZlWkxK?=
 =?gb2312?B?WGJWd3FqL3ZFbDR1dElZb3VHUUVmVWlJOFMwTGF3R01wbVkzZk8xL0w1RXkx?=
 =?gb2312?B?L1Y5UDE2Q2FmcVJTdGJZVytlemk1RUpucVF6d24yRXl0UC9oaXk3V3ZsanFD?=
 =?gb2312?B?L1RzMmZ1MWNVVTNCbkRQOFRkeHF4UnUxdWRmMGljTlNaMjhzZGUvcHFGa1lV?=
 =?gb2312?B?QXBQVHJQWndUOERSekJzejBpVGUwMVdXbnFlLzkwOHpiTTE0ZCtJWjBMTzBB?=
 =?gb2312?B?NmwzbUJERk5OK2pqSWR4MWpzSE9qU3c5ZHY4Z05KRXVxRnJVSk1OSGNSbHh5?=
 =?gb2312?B?eXZ4QnVtK3VaeFFTcTJzQ0ZEbXJvL0RLaFpNZHQxNmdRNzdMUXFCNHA0WVBO?=
 =?gb2312?B?ckF0WS85dGJ3NkRzcDVVanBTR3NjdWUvem8wcUlVRTRsM25WUnRzMnk3OWkw?=
 =?gb2312?B?N2NXLzhxWDJWTm1lNWNaNzB2NEVsSmFEOFRDcHN4K3k5bzUwaVlSQ1BETC80?=
 =?gb2312?B?clR0NWk1bGFXRmdsRzRBajVrZzU5N0t2ZENpZDllWkJmMklWWmNwNFZJeVlj?=
 =?gb2312?B?ZlVSMTRDcDZJZjNIekpTUUVrZUNpMy9ic2Y5bWFpMkN5UktOdWhtb3RrMGIr?=
 =?gb2312?B?V2NJMXZZYkt3PT0=?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3749.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0529fbb1-ae02-4691-7a97-08df21f98dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 09:26:21.8732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR03MB443231

SGksCgpPbiBhbiBBU1VTIFZpdm9ib29rIFMxNiAoYm9hcmQgUzU2NTJNQSksIGNvbm5lY3Rpbmcg
b3IgZGlzY29ubmVjdGluZyB0aGUKY2hhcmdlciBsb2dzOgoKICBhc3VzX3dtaTogVW5rbm93biBr
ZXkgY29kZSAweGIwCgpUaGlzIGlzIHRoZSBzYW1lIGV2ZW50IHRoYXQgY29tbWl0IDFiM2VlZjQ1
OGYzNiAoInBsYXRmb3JtL3g4NjogYXN1cy13bWk6Cklnbm9yZSBXTUkgZXZlbnRzIHdpdGggY29k
ZXMgMHg3QiwgMHhDMCIpIGFscmVhZHkgaGFuZGxlcyBvbiB0aGUgQVNVUwpHVTYwNFYuIFRob3Nl
IGtleXMgd2VyZSBtYXBwZWQgdG8gS0VfSUdOT1JFIHRvIHNpbGVuY2UgdGhlIG1pc2xlYWRpbmcK
IlVua25vd24ga2V5IGNvZGUiIG1lc3NhZ2UuCgoweGIwIGNhcnJpZXMgdGhlIHNhbWUgY2hhcmdl
ciBub3RpZmljYXRpb24gYnV0IGlzIG5vdCBwcmVzZW50IGluIHRoZSBrZXltYXAKZm9yIHRoaXMg
bW9kZWwsIHNvIGl0IGhpdHMgdGhlIHNhbWUgbWVzc2FnZS4gT2JzZXJ2YXRpb25zIG9uIHRoZSBT
NTY1Mk1BCihrZXJuZWwgNy4yLjgsIERlYmlhbiBzaWQpOgoKICAtIDB4YjAgZmlyZXMgb25seSBv
biBBQyBhZGFwdGVyIHBsdWcvdW5wbHVnLgogIC0gUHJlc3NpbmcgYWxsIEZuIGtleSBjb21iaW5h
dGlvbnMgZGlkIG5vdCBwcm9kdWNlIDB4YjAsIHNvIGl0IGlzIG5vdCBhCiAgICBrZXkgcHJlc3Mu
CiAgLSBVbmxpa2UgMHhlNSwgd2hpY2ggaXMgcmVwb3J0ZWQgb24gQVNVUyBUVUYgbGFwdG9wcwog
ICAgKGh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld3RvcGljLnBocD9pZD0zMDUwNjMpIGFu
ZCBkb2VzIGhhdmUgYQogICAga2V5bWFwIGVudHJ5IGFuZCBpcyBmb3J3YXJkZWQgYXMgS0VZX1VO
S05PV04sIDB4YjAgaGFzIG5vIGtleW1hcCBlbnRyeSwKICAgIHNvIG9uIHRoaXMgbW9kZWwgdGhl
IG9ubHkgZWZmZWN0IGlzIHRoZSBsb2cgbGluZS4KCk5vdGUgdGhhdCB0aGUgY2hhcmdlciBub3Rp
ZmljYXRpb24gaGVyZSBhcnJpdmVzIG92ZXIgdGhlIFdNSSBldmVudCBHVUlECmhhbmRsZXIsIGFu
ZCAweGIwIGRvZXMgbm90IGFwcGVhciBhbW9uZyB0aGUgTk9USUZZXyogZGVmaW5lcyBpbiBhc3Vz
LXdtaS5jLAp3aGljaCBpcyB3aHkgdGhlIG1lc3NhZ2UgaXMgZW1pdHRlZC4KCk1hcHBpbmcgMHhi
MCB0byBLRV9JR05PUkUgZm9yIHRoaXMgbW9kZWwgd291bGQgc2lsZW5jZSB0aGUgbWVzc2FnZSBh
bmQgbWF0Y2gKdGhlIGV4aXN0aW5nIGhhbmRsaW5nIG9mIHRoZSBlcXVpdmFsZW50IDB4N0IgZXZl
bnQuCgpJIGFtIGhhcHB5IHRvIHRlc3QgYW55IHByb3Bvc2VkIGNoYW5nZSBvbiBteSBoYXJkd2Fy
ZS4KCkJlc3QgcmVnYXJkcywKTGkgTGVp
