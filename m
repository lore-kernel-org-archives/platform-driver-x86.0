Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466600;
	b=xJnZusCx+b9/UhcXJ4MXzoyS29fHUCS2hjda1jH/7/fXAJC+I/wYoFbDuCIai34GWfcO
	 ZDKXf2fw1CEPUCC7E1F7nETcK1qpcXbdEW/FHps5j8MZNX3ArWIKYDRUiw+Dn26kZCKRF
	 CUGguxJ34t6lu0JH6cKi7N8GMzSzBuIGtSvHG3lUi6dOw+sgizqn1D3DyZH2h/vVei4An
	 MY5PI1km9tfNhsuMUTNhTJitJnXCn5W0gLeUeqJPF4fqarwTQHf43Vn42BIO6PQna1i0b
	 HKfh4DUNUec3emenqXLFqVAvudrXAisrIrYHD/y6CYATnIMhfG01zgFkAoiTnzBmgJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466600;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XK5nKM/YEPb6iHaZKffjD+LWXGCGGNpxNhOgsL3B+Tg=;
	b=0PzBEpZ+RkNRQbx1K2Dh356fVub+hDeVLzwdTR40bmFzjopWqG//T2H3/8fiP9FXfuVW
	 JGAfiQEZ1NSqcPlytemGDx0zKTtEy/hPXChqweVYhSdqeWg8YGg87jzrA+p2RkNeFLua3
	 sUVBuEZgpI3NHpIEoPbP3ibVbwpS13632rhJ2PcbFrH27+jms7sMDUCMX/JpZR0CnyuJq
	 smXjzjIZQSh17SX8kfHnf9/02AbUqQyHsiZxOMx4rOiO2GqoGCLafq0/WYRHHoH+LJOOv
	 D6ea0uXnHlrKIle9O5D4qOAk8f6EdGPRauuMF6wRbioNYKp+Yn0iyM4tVVu2yQau+uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="g8/t5lud";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.57
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012057.outbound.protection.outlook.com [40.93.195.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3607F606A321;
	Mon, 23 Nov 2026 20:43:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3607F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g8/t5lud
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zG9pNhFmwaKKbl8Q5CWEhVFtwTnb2wRPRnTrjCsw+K6dfpVNBLFclJ2uyYqi732Ow/Ki5D0xv2GFiKLjbYcVEua/J2EVnXYSZu8iL9lgZY0LstOG7nGfGekpE9jMpvNGxUV+aTTiWTxOzHut1583y3p69C8VQz5bsCAfbUSDF8JC7Vdny2wqHrgrmGQBmAIxeUG0gFHPe6doF2Ua642mdDNmWJTmjnD0OaVT9G5r93/sRpEbS8ZuyDxYI3/7G/fyi5kPixGImOIxClQa9/2g2ArRix3udiFAR2tvi6GP6Vd5SnkliAzgpO45uMLDQpdxTKRHLQRNWgqsF+uE8Af8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XK5nKM/YEPb6iHaZKffjD+LWXGCGGNpxNhOgsL3B+Tg=;
 b=Ij6drb4tS4bfUy1eEcImYAobBAR4TinoShEHs46pIsgzNhjYmmLwg55AJIy9tooOtCzbNdmlOKIssJo6jGqI3+qIEtwbzUrJrjnF7bR7f4XVQ9sET8RyA4KzNvZP+9S1Ans2Rp+wWwhfUPJAok4de2zm7w3bG0px16FR8qti9877lM8kSVzg7mxFYbPZ8Gezxmxa7Co0R693XlNehr9QWMPYLpMsh58cakJ0/ELliwqJJvjW8O6OOj1WWCMmH0ujeDDF8hkwsP8xvDA0uCyNENlwFJUMXjfVg3DVj0q3GvpxExNLB1wSHKXj8EhDElonKJjGUOQv9jaKlZMdlH/kHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XK5nKM/YEPb6iHaZKffjD+LWXGCGGNpxNhOgsL3B+Tg=;
 b=g8/t5ludpZ2UoiNcKravjK662kzslDFMTkpxq6iorZ9Pi2hcGJTmruQ3wfqT5k3qNAcQPady3MFyrLYeuuovW6OcVul3L/P0Ij+cft/YAcDks6cbXRO85aBMr/njmeZk112MOb4A96KHvt75vQLnxI+Xp9RPqD/fhLZ9651D5kx4DjwcQwt3IDRy4z423dEicjsdFTjXcuStTnUSaAc1w8okE/TXBR/qQMhGv0Ba0jvwfZcz0GWLpfrqB2I+wTH1QoWqcppHpSXemsTLrhEnDd8YQ/kBHawh7LtgACiFEQYZevttp6ivfTbzHVb0zEidS17KVfNILZVUBMEKcCBRug==
Received: from MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13)
 by CY5PR12MB6057.namprd12.prod.outlook.com (2603:10b6:930:2e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Mon, 23 Nov
 2026 20:43:15 +0000
Received: from MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854]) by MN0PR12MB5786.namprd12.prod.outlook.com
 ([fe80::ae61:c9b4:847b:4854%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:43:15 +0000
From: Brian Mak <bmak@nvidia.com>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
CC: Hans de Goede <hansg@kernel.org>, =?utf-8?B?SWxwbyBKw6RydmluZW4=?=
	<ilpo.jarvinen@linux.intel.com>, Kurt Borja <kuurtb@gmail.com>, Stuart Hayes
	<stuart.w.hayes@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Lyndon
 Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr
	<prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Topic: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Thread-Index: AQHdeUxZSHH0y3AHX0KMIS92REQ5Gbc3sXIAgARYswCAAAfwgIAAEdcA
Date: Mon, 23 Nov 2026 20:43:15 +0000
Message-ID: <133d5bdb-19f0-49d8-8906-ee3af21397c8@nvidia.com>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
 <20261123193923.cl2i62lgute6li3u@pali>
In-Reply-To: <20261123193923.cl2i62lgute6li3u@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5786:EE_|CY5PR12MB6057:EE_
x-ms-office365-filtering-correlation-id: 3100e30b-b9a1-4ae3-49e8-08df49a26631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261021130227099003|261021121427099003|261026130827099003|261021135927099003|261028144727099003|261026121527099003|261022113327099003|261022105027099003|261022075727099003|261026140227099003|261022115727099003|261021123027099003|261102123227099003|38070700021|4143699003|11063799006|5023799004|56012099006|10067099003|261009223027099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 AVlFE2croxkaoO/3B6SIo4h1l7A8OWBLbZt82XJXfRSu65fth9vptm1DqJWWTaTT4rciSklD9gUUu+s8reIwLRvS0qRbArqFw0c2EFR3fQIrCAPUp4F7MP21QUgqjXyDALbYzA9Q2tFN6Awvw0KvGf/1A1elVqtPSP4o7/hh3aK6Ab9bEB47x115KZJG06KuzX3u+XNZQBd2+sC7pdj0Fs8vzgREj0RNNGSHsU9cbdJ6NfsHyBAR3fuR4Y/KvdxtvUdE8f5J7IeaGaJ0JWnG6B5yVkp3eVBRSmw7uj9E6tmjiCkUv95JE1a2UWT9uHLbig+egxtmpVtrukyQdc9D+XmhUmkA7U9nmoqaHDzTgS9j+3k4K5dZrWn4sAPbEtqST4K/qlleeRkCItomftq66idCacCWS+EqG3/wxzQ0l4VYbhuwUV6aO/w9hnOMK0D5wIvRIN57O80ItXXUOGrOgCdkX9la90mBm6fEL8u4K2u3duyJILfHGr2a94E2b/TJOevkOttba8yFjyJi2yEfMwfU6ayTcRkBC92X8DC/4R/sBY2OLPb6EbEDPlYaFORpsriekDdR9XiZ4mDB5M6Ao+lhAwwVqrmApi9UaNKUKQ40pkDoF4NdI+HrNtRYkAsia+IP5cYsFt3DDESjtHweDhWrTxliFs7IBpSBEgwRtzLC12nK+Lqu6ZQ4dXQBM8X45rlco/seD/NBQuG2KobzFw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5786.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261021130227099003)(261021121427099003)(261026130827099003)(261021135927099003)(261028144727099003)(261026121527099003)(261022113327099003)(261022105027099003)(261022075727099003)(261026140227099003)(261022115727099003)(261021123027099003)(261102123227099003)(38070700021)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M1VNb2NCUTduYjNwRHRDWmhrc0xXU25FZGtnN3poK0o1TjJaaTVRKzgyVGRR?=
 =?utf-8?B?M2hNTnk0clZOb3pyWmZDRFdNcGFXYkdmL1o4UkhKUjZCYUxmRDVrNk5lVHRD?=
 =?utf-8?B?L2xGdUVVaWx3SmdFZjAzeERlMFkvb3A4aTdTQ2E4UVBsM2NFS3g2QXFKYVNB?=
 =?utf-8?B?dUpPUDdSbHFpbXFOcVhhcFY1RkZFOTRYa0JnSXZLZENJVlk5b3hlajJWMFNL?=
 =?utf-8?B?RG4wRVhjazlnVDA0VndITWlzSnNhaTJ2eUpyUEUyMzVoREl4QXFuWE1kV3Fi?=
 =?utf-8?B?Z1RaU3Nmb0NmVXVvTGIwQUZDQWtXM1I3c2U5TVR2YjZrUFh4dzlTeTVtTG00?=
 =?utf-8?B?Ny9odUp2U1BLckpRV09oWGVOK2xHNEI2Q3VTa0YwNEVCUS9TQ3N6TU1rTHFD?=
 =?utf-8?B?bm14SE05Qk1aTXE0a2JJd0E4aWFYYXRVb0d0S0s0eVUxd3dkTmJ6SURiemJU?=
 =?utf-8?B?dW05a2czcXhYaDJLaXRrVy9RQVhQdzU4WHpvdk56L2c1ZTR4WnFqT3RwOW80?=
 =?utf-8?B?RmlIY0pKUjN5YmROczVNT0pLdXAzTXQxbVhmVkZIMElFYkRsTDlKK3V6eFBw?=
 =?utf-8?B?YnhjZXFFdzFQZTBXSy9zOFI3MGlIc00xTCs0MjdrTjRHRS9kS3FmRWE0TEh2?=
 =?utf-8?B?YXl4SSs2elR1YmRrdkUyK1NQSVFJRVJRQldhOFl1MURJdDJZcFM0N2w3SFE2?=
 =?utf-8?B?VmwzY0hvcU04dUdEOUl2b3haWFhPbDJic1YwZWkrM2RvbWJFQlYxcEEvZU15?=
 =?utf-8?B?Z09CL0lmT0ZsckVsWGI5QXJ2c1JIN01icXBrd2xrc1ZteVNZYlRCN29hZXJo?=
 =?utf-8?B?Si9RUHArSGZycFk2SHRQSDVYaDhvakVsRU51T1ZLZXhZTy9tc3NIYUx4SFlK?=
 =?utf-8?B?ekRYVjhtd2pBeXY5WXo0YzJDZ01uK08ySzdQczl6ekhORk1mNno2L2pBbXg0?=
 =?utf-8?B?ZXc0SzlOS1Z5Mnhxb0IrSmV6cVNDNGdPcHBzbGZod05ieGN6YjNNL1o2MjM4?=
 =?utf-8?B?dXR3aGNvclJyVFRKR0RMS28yRWpSVGVQakJpVXFaZXVDdW5rT3BJRnQ5S2wv?=
 =?utf-8?B?cVRqaFNyeWlHd25hRU9LbFkvbThKVnlWRkk4WDU4REd1R0V0cXhuVTRrNHpS?=
 =?utf-8?B?dXg5bGp3NXRQRWpLd2VVUG5GeVlTcy9ZSzhkWFdUVEhHdUExTjMyOHNZMVVt?=
 =?utf-8?B?aW52Mjc3OEpGVUVFT0FSbFBqQ2UrVjRybGFOOVBwUmZGREVPeEVxTDk1aWQ1?=
 =?utf-8?B?SGh1UlgvalErMkMyTGxwcEFOejV1UzE2bE80b0E5cGpkaWVxaXhJVjhqa2Fk?=
 =?utf-8?B?Z042ZCtqYkNrSjNRZ1JGODNvcUlMeldjZGhxYyt5bm5pK01ZRDVOaXc0bk1O?=
 =?utf-8?B?ekNTUnIyRXdSUGIyaXI2Q2tGRjA0emZ2S3hkcTQxZENjVHA5VEJxZlZZb0N5?=
 =?utf-8?B?V09QSWc3a01PTDZpM3p0YUtGUGJucmUwaDBEWjM5VERpRlZZSERFNFlKMlls?=
 =?utf-8?B?RWpoTU9HMUhJSkRsUmNmeFUvaWsvd0F2RlQrSUhsUWVCaTNtU21XcXpvWlZo?=
 =?utf-8?B?VUFXOGxObzJNR0xjRmhEVFBndERycG9uVlVBNmZTVmZUUGhUUzRCZm5wR1Fp?=
 =?utf-8?B?TGNWYjdjdGgxcUFFZzcwV0RXVXA1OSt2cUJwYVRiTXgzbWE1ejVyWmRpWjFK?=
 =?utf-8?B?SnA5RFdqODMwVHFYTkpmUW1DZDJxTnQrZTFDNGdqYksrY0xpWERaWTdKM0pk?=
 =?utf-8?B?bFAzeW1ENHNQODRUY1NoZndOSEhPWVkvNnFBWnh5dk0yODMyVHpqcGorUjNT?=
 =?utf-8?B?OFpGYjl6ZStDd0w5Y1JxVFBsY3FtU1VKeHZldTZCNTRmQ3NWRGMzWU0rcERR?=
 =?utf-8?B?TTNBT1FHTjZZaUJrT1FZTXg4cnYwM3cxRDJqaWlvSjlYQ0pBQ0VqMGMxVzZh?=
 =?utf-8?B?d254bmxrL3pKY2xSb29tMXZBak1zbnlFeXZ3ejRKN0U3MkdCejErQnNlSktL?=
 =?utf-8?B?OHNKQW5CMmtUZmNBVGVMdnBPUTdrZVppeFpnNDRCTXZVY29hMzVFRGlVK1lT?=
 =?utf-8?B?d29aSEdncW1OYSttUmJqNERBWEk2ZVlkRkxpcXhxQWdDTU1tMkt3MGpDOHZK?=
 =?utf-8?B?Y0FlSUZMR0J3Y0JJUDFGSHZFM3laOG53SWtRK1Q2MWtDd2FTWU5sdy9Ld1Fu?=
 =?utf-8?B?blZOU1YwQmVGd1FrZ1N1Q3dCazhvM1F6ZU40THNScUVPY1pmRm05bWFpQW5q?=
 =?utf-8?B?WmJjV2dQdnJHa1JVbmg4OURYZDdCc1BPS2RVTmVFalNya0JRUmk2dVpMRHpr?=
 =?utf-8?Q?PlfvK3DsIkrHUmBNdm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF637E03B11CA4C960D5F6257005121@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5786.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3100e30b-b9a1-4ae3-49e8-08df49a26631
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2026 20:43:15.7558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L0lRxUfGUSB3m0bxvi97yXukuWwGiV4RHPI8pZrRQEENOi4Rwfq72E8ykdQohpQ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6057

T24gMTEvMjMvMjYgMTE6MzksIFBhbGkgUm9ow6FyIHdyb3RlOg0KPiBPbiBNb25kYXkgMjMgTm92
ZW1iZXIgMjAyNiAxOToxMTowMCBCcmlhbiBNYWsgd3JvdGU6DQo+PiBPbiAxMS8yMC8yNiAxNjo0
OCwgUGFsaSBSb2jDoXIgd3JvdGU6DQo+Pj4gT24gRnJpZGF5IDIwIE5vdmVtYmVyIDIwMjYgMTY6
MDU6NTAgQnJpYW4gTWFrIHdyb3RlOg0KPj4+PiBDT05GSUdfREVMTF9MQVBUT1AgaXMgY3VycmVu
dGx5IG5vdCBhdmFpbGFibGUgb24gQVJNNjQsIGR1ZSB0byBhDQo+Pj4+IGRlcGVuZGVuY3kgb24g
Q09ORklHX1NFUklPX0k4MDQyLiBUaGlzIGRlcGVuZGVuY3kgaXMgYWN0dWFsbHkgbm90DQo+Pj4+
IG5lY2Vzc2FyeSwgYXMgdGhlcmUgaXMgYSBmYWxsYmFjay4gTWFrZSBpdCBvcHRpb25hbC4NCj4+
Pg0KPj4+IGk4MDQyIGlzIHVzZWQgZm9yIGNvbnRyb2xsaW5nIHRvdWNocGFkIExFRCBhbmQgZm9y
IHJlY2VpdmluZyByZmtpbGwNCj4+PiBldmVudHMgd2hlbiB0aGUgZGVsbC1yYnRuIGlzIG5vdCBz
dXBwb3J0ZWQgb24gdGhlIHBhcnRpY3VsYXIgbWFjaGluZS4NCj4+Pg0KPj4+IFRvdWNocGFkIGxl
ZCBpcyBhdmFpbGFibGUgb24gbW9yZSBWb3N0cm8gYW5kIEluc3BpcmlvbiBtYWNoaW5lcyBhbmQN
Cj4+PiB0aGVyZSBpcyBubyBmYWxsYmFjayBvciBkZXRlY3Rpb24gb2YgaTgwNDIgYXQgYWxsLiBF
dmVuIHRoZXJlIGlzIG5vDQo+Pj4gZXJyb3IgY2hlY2tpbmcuDQo+Pj4NCj4+PiBBbmQgZm9yIHJl
Y2VpdmluZyByZmtpbGwgZXZlbnRzIGl0IGlzIHNhbWUgc2l0dWF0aW9uLg0KPj4+DQo+Pj4gU28g
dGhlIGRlbGwtbGFwdG9wIGRyaXZlciBleHBlY3RzIHRoYXQgdGhlIFNFUklPX0k4MDQyIGlzIGVu
YWJsZWQgYW5kDQo+Pj4gY29tcGlsZWQgaW4uDQo+Pj4NCj4+PiBJZiBub25lIG9mIHRoZXNlIGZ1
bmN0aW9uYWxpdHkgaXMgYXZhaWxhYmxlIG9uIGFybTY0IEhXLCB0aGVuIGl0IG1ha2VzDQo+Pj4g
c2Vuc2UgdG8gbWFrZSB0aGUgU0VSSU9fSTgwNDIgb25seSBmb3IgeDg2LiBBbmQgdGhlbiBpbiB0
aGUgZGVsbC1sYXB0b3ANCj4+PiBkcml2ZXIgbWFya2luZyB0aGUgeDg2IHNwZWNpZmljIGRlcGVu
ZGVuY3kgdmlhIGlmZGVmcy4gV2hpY2ggYWxsb3dzIHRvDQo+Pj4gY29tcGlsZSBkcml2ZXIgb24g
YXJtNjQgd2l0aG91dCB0aG9zZSBzcGVjaWZpYyBmdW5jdGlvbmFsaXRpZXMuDQo+Pg0KPj4gU0VS
SU9fSTgwNDIgYWxyZWFkeSBjYW4ndCBiZSBlbmFibGVkIG9uIGFybTY0LA0KPiANCj4gVGhhdCBt
YWtlcyBzZW5zZS4gaTgwNDIgaXMgeDg2IHNwZWNpZmljLg0KPiANCj4+IGFzIEFSQ0hfTUlHSFRf
SEFWRV9QQ19TRVJJTyBpcyBub3Qgc2V0LiBXaXRoIHRoZSBjdXJyZW50IHBhdGNoLCB0aGUgZHJp
dmVyDQo+PiBidWlsZHMgb24gYXJtNjQsIGJ1dCBhcyB5b3UgbWVudGlvbmVkLCB0aGVyZSdzIGEg
Y291cGxlIGdhcHMgdGhhdCBuZWVkDQo+PiB0byBiZSBhZGRyZXNzZWQgd2l0aCByZmtpbGwgYW5k
IHRvdWNocGFkIExFRC4NCj4+DQo+PiBGb3IgcmZraWxsIGN1cnJlbnRseSwgdGhlIGRyaXZlciBm
YWlscyB0byBwcm9iZSwgZHVlIHRvIGEgZmFpbGVkDQo+PiBpODA0Ml9pbnN0YWxsX2ZpbHRlciBj
YWxsLCBpZiB0aGUgZGV2aWNlIGlzIGEgTGF0aXR1ZGUgb3IgYSBQcmVjaXNpb24NCj4+IChjaGVj
a2VkIGJ5IERNSSkgb3IgZm9yY2VfcmZraWxsIGlzIGVuYWJsZWQsIFNNQklPUyByZXBvcnRzIGFu
IHJma2lsbA0KPj4gc3dpdGNoLCBhbmQgZGVsbC1yYnRuIGlzIG5vdCBzdXBwb3J0ZWQuIFRoYXQg
ZG9lc24ndCBhcHBseSBmb3IgdGhlIFhQUw0KPj4gMTYgQ3JlYXRvciBFZGl0aW9uLCBidXQgaXQg
bWF5IGZvciBhbiBBUk02NCBMYXRpdHVkZSBvciBQcmVjaXNpb24NCj4+IHByb2R1Y3QuIEZvciB2
MiwgaWYgZGVsbC1yYnRuIGFuZCBpODA0MiBhcmUgYm90aCB1bmF2YWlsYWJsZSwgSSBjYW4gbWFr
ZQ0KPj4gcmZraWxsIHNldHVwIGZhaWwgd2l0aG91dCBmYWlsaW5nIHByb2JlLg0KPiANCj4gV2Vs
bCwgaGVyZSB0aGUgbWFpbiBwb2ludCBpczogd2hvIChmcm9tIEhXIHBvaW50IG9mIHZpZXcpIHdp
bGwgcmVwb3J0DQo+IHRoZSByZmtpbGwgZXZlbnQ/IEl0IGNhbm5vdCBiZSBpODA0MiBiZWNhdXNl
IHRoaXMgY29udHJvbGxlciBpcyBub3QNCj4gcHJlc2VudCBvbiBhcm02NC4gTXkgZ3Vlc3MgaXMg
dGhhdCBkZWxsLXJidG4gaW50ZXJmYWNlIGlzIGFsc28gbm90DQo+IHByZXNlbnQgYXMgSSB3YXMg
dG9sZCB0aGF0IERlbGwgYWJhbmRvbmVkIHRoaXMgaW50ZXJmYWNlIGV2ZW4gb24geDg2Lg0KPiAN
Cj4gU28gZm9yIGFybTY0IHBsYXRmb3JtIHRoZXJlIGhhcyB0byBiZSBzb21lIG90aGVyIHNvdXJj
ZSBvZiByZmtpbGwNCj4gZXZlbnRzLiBPciByZmtpbGwgaXMgbm90IHByb3ZpZGVkIGF0IGFsbC4N
Cj4gDQo+IEkgZG8gbm90IGtub3cuLi4gYmVjYXVzZSBJIGRvIG5vdCBoYXZlIHRoaXMgaGFyZHdh
cmUuIFNvIHRoaXMgcXVlc3Rpb24NCj4gaXMgZm9yIHNvbWVib2R5IHdobyBpcyB3cml0aW5nIGRy
aXZlcnMgZm9yIHRoaXMgcGxhdGZvcm0uLi4NCg0KSSBzZWUgeW91ciBwb2ludC4gSSB3YXNuJ3Qg
YXdhcmUgb2YgdGhlIGhpc3Rvcnkgd2l0aCBob3cgZGVsbC1yYnRuIHdhcyANCmFiYW5kb25lZC4g
VGhlIGRlbGwtcmJ0biBpbnRlcmZhY2UgaXMgbm90IHByZXNlbnQgb24gbXkgWFBTIDE2IENyZWF0
b3IgDQpFZGl0aW9uIGVpdGhlci4gVGhlcmUgaXNuJ3QgYW4gcmZraWxsIGludGVyZmFjZSBvbiB0
aGlzIHBsYXRmb3JtLCB0byBteSANCmtub3dsZWRnZS4gV2hlbiBJIHN1Z2dlc3RlZCB0byBtYWtl
IHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyANCnByb2JlLCB0aGF0IHdhcyBmb3Ig
aW4gY2FzZSB0aGUgZGVsbC1yYnRuIGludGVyZmFjZSBpcyBhdmFpbGFibGUgb24gYSANCmZ1dHVy
ZSBwbGF0Zm9ybS4gU2luY2UgeW91IHNhaWQgdGhhdCBpdCdzIGFiYW5kb25lZCwgSSB3b3VsZCBh
Z3JlZSB0aGF0IA0KdGhlcmUncyBubyBzb3VyY2VzIGZvciByZmtpbGwgZXZlbnRzIG9uIEFSTTY0
Lg0KDQpJIGNhbiBnYXRlIHJma2lsbCBzZXR1cCBsb2dpYyBiZWhpbmQgYW4gaWZkZWYgYXMgd2Vs
bCB0aGVuLCBmb3IgdjIuDQoNCj4gSW4gYW55IGNhc2UsIGl0IGRvZXMgbm90IG1ha2UgYW55IHNl
bnNlIHRvIHByb3ZpZGUgImZha2UiIG9yICJkdW1teSINCj4gZGV2aWNlIGJ5IGxpbnV4IGp1c3Qg
dG8gbWFrZSBkcml2ZXIgY29tcGlsYWJsZS4NCg0KSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3
aGF0IHlvdSBtZWFuIGJ5IHRoaXMuIFVuZGVyIG15IG9yaWdpbmFsIA0KcHJvcG9zYWwgb2YgbWFr
aW5nIHJma2lsbCBzZXR1cCBmYWlsIHdpdGhvdXQgZmFpbGluZyBwcm9iZSwgbm8gZHVtbXkgDQpk
ZXZpY2VzIHdvdWxkIGJlIGV4cG9zZWQgYnkgdGhlIGRyaXZlci4gcmZraWxsIHNldHVwIHdvdWxk
IGZhaWwgDQpncmFjZWZ1bGx5LCBhbmQgdGhlIHJma2lsbCBkZXZpY2VzIHdvdWxkIGdvIGF3YXkg
d2l0aCBpdC4gSSBhZ3JlZSB3aXRoIA0KeW91LCBidXQgSSdtIG5vdCBzdXJlIGlmIEknbSBtaXNz
aW5nIHNvbWV0aGluZyBoZXJlLg0KDQo+PiBGb3IgdGhlIHRvdWNocGFkIExFRCBjdXJyZW50bHks
IHRoZSBpODA0Ml9jb21tYW5kKCkgc3R1YiB3aWxsIHJldHVybg0KPj4gLUVOT0RFViBhbmQgZG8g
bm90aGluZy4gVGhpcyB3aWxsIHJlZ2lzdGVyIGFuIExFRCB0aGF0IGRvZXMgbm90aGluZy4gRm9y
DQo+PiB2MiwgSSBjYW4gZ2F0ZSB0aGUgTEVEIHJlZ2lzdHJhdGlvbiBiZWhpbmQgYSBTRVJJT19J
ODA0MiBpZmRlZi4NCj4gDQo+IEkgdGhpbmsgdGhhdCB0aGlzIGlzIGNvcnJlY3Qgd2F5LiBUaGUg
aTgwNDIgdG91Y2hwYWQgbGVkIHNob3VsZCBub3QgYmUNCj4gZW5hYmxlZCB3aGVuIHRoZSBpODA0
MiBIVyBpcyBub3QgcHJlc2VudCBhdCBhbGwuIEFuZCB0aGF0IHRvdWNocGFkIGxlZA0KPiBpcyBv
bmx5IGZvciBmZXcgbW9kZWxzIGJhc2VkIG9uIHdoaXRlbGlzdC4NCj4gDQo+PiBGb3IgdGhlIEtj
b25maWcsIHNpbmNlIGk4MDQyIGlzIHJlcXVpcmVkIG9uIHNvbWUgeDg2IERlbGwgcGxhdGZvcm1z
LCBJDQo+PiBjYW4gY2hhbmdlIHRoZSBLY29uZmlnIGRlcGVuZGVuY3kgdG8gYmUgbGlrZSBzdWNo
LCB0byBlbnN1cmUgdGhhdA0KPj4gU0VSSU9fSTgwNDIgaXMgcmVxdWlyZWQgb24geDg2IGFuZCBv
cHRpb25hbCBlbHNld2hlcmUgKGluIGNhc2UgdGhlcmUncw0KPj4gYW5vdGhlciBhcmNoIGludHJv
ZHVjZWQgYnkgRGVsbCB0aGF0IHN1cHBvcnRzIGk4MDQyIGluIHRoZSBmdXR1cmUpOg0KPj4NCj4+
IGRlcGVuZHMgb24gU0VSSU9fSTgwNDIgfHwgKFNFUklPX0k4MDQyID0gbiAmJiAhWDg2KQ0KPj4N
Cj4+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0aGVzZSBjaGFuZ2VzIGFyZSBnb29kIHdpdGggeW91
Lg0KPj4NCj4+IFRoYW5rcywNCj4+IEJyaWFuDQo+IA0KPiBNeSBwZXJzb25hbCBvcGluaW9uIGlz
IHRvIG1ha2UgaTgwNDIgZGVwZW5kZW5jeSBvbmx5IG9uIHg4Ni4gQW5kIGRvIG5vdA0KPiBldmVu
IHRyeSB0byBlbmFibGUgaTgwNDIgb24gbm9uLXg4NiBwbGF0Zm9ybXMuIEFsbCBkZWxsIGRyaXZl
cnMgd2VyZSBpbg0KPiB4ODYgc3ViZGlyZWN0b3J5IHdoaWNoIGNhdXNlIHRoYXQgZXhwbGljaXQg
eDg2IHdhcyBub3Qgd3JpdHRlbiBpbg0KPiBLY29uZmlnIChhcyBpdCB3YXMgbm90IG5lZWRlZCku
DQo+IA0KPiBOb3cgd2hlbiB5b3UgYXJlIG1vdmluZyBkZWxsIGRyaXZlcnMgb3V0IG9mIHRoZSB4
ODYgc3ViZGlyLCBtYXliZSBpdA0KPiBjb3VsZCBtYWtlIHNlbnNlIHRvIGNoZWNrIGlmIHRoZXJl
IGFyZSBzb21lIG90aGVyIGNvbmZpZyBvcHRpb25zIHdoaWNoDQo+IGhhdmUgYWxzbyBoaWRkZW4g
ZGVwZW5kZW5jeSBvbiB4ODYuDQo+IA0KPiBBbnl3YXksIEkgaGlnaGx5IGRvdWJ0IHRoYXQgYW55
IG5ldyBwbGF0Zm9ybSAvIGRldmljZSAod2hpY2ggaXMgZGVzaWduZWQNCj4gZnJvbSBzY3JhdGNo
OyBub3QgcmVicmFuZGVkIG9yIGV2b2x1dGVkKSB3b3VsZCB1c2UgaTgwNDIgZm9yIGFueSBzdWNo
DQo+IEFQSS4gTm93YWRheXMgYWxsIHRob3NlIGZ1bmN0aW9uYWxpdGllcyBhcmUgYmFzZWQgb24g
QUNQSSBvciBXTUkgQVBJcy4NCg0KSWYgSSB1bmRlcnN0YW5kIHlvdXIgc3VnZ2VzdGlvbiBjb3Jy
ZWN0bHksIHlvdSBhcmUgYXNraW5nLCBpbnN0ZWFkIG9mIA0KYWRkaW5nIGlmZGVmcyBhZ2FpbnN0
IFNFUklPX0k4MDQyIGFuZCBjaGFuZ2luZyB0aGUgZGVwZW5kZW5jeSB0bzoNCg0KZGVwZW5kcyBv
biBTRVJJT19JODA0MiB8fCAoU0VSSU9fSTgwNDIgPSBuICYmICFYODYpDQoNCllvdSB3b3VsZCBn
YXRlIGJlaGluZDoNCg0KZGVwZW5kcyBvbiBTRVJJT19JODA0MiB8fCAhWDg2DQoNCmFuZCB0aGVu
IGFkZCBpZmRlZnMgZm9yIFg4Niwgd2hlcmV2ZXIgaTgwNDIgaXMgdXNlZD8NCg0KVGhhbmtzLA0K
QnJpYW4NCg==
