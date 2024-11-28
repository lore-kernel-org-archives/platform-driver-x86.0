Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C54C7C
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753579; cv=fail; b=HLB3tKPc4ygRrbMj3DDhqvbVeIKwmAMqF5DVSdskyj/1TP9nA7reIlQpe94GWcAGNn0Ok/1lFUgzCx8qxHpllR+VXzbnCTLY/l0TTUYtJrC5jMsaf/7vpTQsf2ppjDrcQrjV5Vq5lyjYrUdeYM5EvEnpMBJQZIkc/1rbLy2KbmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753579; c=relaxed/simple;
	bh=hccG5TI4YvPgtz8ZP6RHBiGqTXfvS376asfKVlRgS0k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gqn1Z8/1KQJP2Ewxg4i7mCh9SA7McCKPngMAQq3h4LMHo/1fhsATMAN+UPo3BwoLA8W0txMlG6rGKqKfJn32yVKZvXj6FHAFcGeuatUoaWRsXcUFWgH1pv6B/8Rqz6v14y2DrnCceGpb1tv3xQopOIKjHZ/cM3zDD35eHJj/NSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=L3D4YBeP; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=dF+ghkfp; arc=fail smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="L3D4YBeP";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="dF+ghkfp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753577; x=1764289577;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hccG5TI4YvPgtz8ZP6RHBiGqTXfvS376asfKVlRgS0k=;
  b=L3D4YBePbZj0V9brRd4oL2xX8yDCmvOMZcZSSiyFAJt0i8CwrYQpAC6n
   Iu6Jpi2v+Zm6y3pDAD2/wNpxfQ05vZ45H2ULOLCx/Pq9HC5PT/WxUvpk7
   u/4ippgKIHw5b/jWdPLl/mxkJNW/MNwavuaYa25dk+RsS+s52tGRTu206
   EEyaH4VUSyFzIfNFG6jo8bxyynYESVdG4tr905CBiFMNlR6zygV/jtvWe
   3z8+Nge+29VZNF/1t5qBIDCLZys/0/+/7IOqmM40i6e/LvJljaDRr05ym
   V9d5bQceosfaJq68WGFnivF62tAUGWUtlz2ER1PyVS3Gm4HVeMThl3j8O
   g==;
X-CSE-ConnectionGUID: tO4q+QG1ToCqziS5zcufnQ==
X-CSE-MsgGUID: /4jrD6ZARtaINujSMokEPw==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32441003"
Received: from mail-westcentralusazlp17011026.outbound.protection.outlook.com (HELO CY4PR02CU008.outbound.protection.outlook.com) ([40.93.6.26])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:26:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcxA77P726R2vnecte54U74r/OSxqLjzZT2IusiyiFiSYOGXPr+e5MEA+pvkTj5n7HQWnmrU2G7XaOiySPg1k8fvGluJsLhkMffXziNQ7Q8zRhj20v3DmyGQM0YV+/7QRBgBzrLBAv/UWoezJnAYGY3xvGwWywqzDTVNojCpnFyY9wnzuE9AdAgUWhVlFdxyzr3ny+wKnAoUlrfNe0C9XEEoWILS/U3z+ABFN952LeVGmC2cj2L9UgsCgVYj6vf4GA2dtEenVPfzyY4Pkyamo6x4QnmUuhHAhZFGRWKtaYdMzjJ29Lz/nHohZ+0F22yaCElx5SnG8z2trKFYM9oV/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8FbZDIujbOzOTg00724IY2j0cTeip1GbVi19MujPMs=;
 b=EwJLtkFHTmOXTzE2QJug9wlZHHPF4b70WyKLkfb1JpeQbJTC78cTeT3C91c8ULMEAg/g8WFi+vhV+7Z1jjxEM9mobB74sXYl1WNQ731oX9Kqs5R7wLuNmiSyMQzVDmH8Yhh33O1vTCbRq66oopQ8chl+hec17LRbVD71dmmgVjn23kH425jz+dmqeQAj/uooU4JRsRvwzxsPVD2z+J2DWFi8efh1kfz/MX8HeWuYfXnokqcwQiCOrHkMVVVHXKNTSPMWMjZ+lxgH+j8er5B9GZwjXYjAB8M48Qx3wVk6ITT0u2Sv7vORS6U1ITgt+/wrKQXuQtFg0UFU8fD685nEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8FbZDIujbOzOTg00724IY2j0cTeip1GbVi19MujPMs=;
 b=dF+ghkfp44ndUuboe+tBWC3oPg/KEZRikuqagPNXEjB5PYFCi9fa1rKqFmdxdxbulO/4IXHD0wCX84rquWRUzETbCW2IVN7YeyiwaarMqzsaxoEWC85RWt2B65QLBPzNA2C/WOH0YGitDeOryZoGR932T+Se7e8G2UgXaDUdLOs=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 DM6PR04MB6811.namprd04.prod.outlook.com (2603:10b6:5:248::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.14; Thu, 28 Nov 2024 00:26:05 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a%4]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 00:26:05 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Hans de Goede <hdegoede@redhat.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, "danielwa@cisco.com" <danielwa@cisco.com>
Subject: Re: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
Thread-Topic: [PATCH v3 4/4] p2sb: Do not scan and remove the P2SB device when
 it is unhidden
Thread-Index: AQHbQJHDV1FYGQWu20KpOYadO+0wTrLK4+sAgADzKQA=
Date: Thu, 28 Nov 2024 00:26:05 +0000
Message-ID: <24wfa4ytdy5brrtflstsnwfspq4eqontuqqwqk4xbeeal67ppi@mcb2amxhhdtd>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
 <20241127060055.357498-5-shinichiro.kawasaki@wdc.com>
 <9606e49a-0a8a-450c-bece-a834df8ea480@redhat.com>
In-Reply-To: <9606e49a-0a8a-450c-bece-a834df8ea480@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|DM6PR04MB6811:EE_
x-ms-office365-filtering-correlation-id: 0f47d04b-d356-4286-ddfd-08dd0f433f38
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mBhNZM2YNba3lZFhYDoM35lp0pOXxzhFpSCaVMFTrK0s0q4YqECSpENfqvkr?=
 =?us-ascii?Q?yCfLZes1S34kiTsJaFpR+cOZESPgmS/7HFPOFpyVxMVcJIhRHL2BznWrX5br?=
 =?us-ascii?Q?8AflRVh3m0/J/DPhdI814XD+yLlc9+R3xPeWPe31QhvlXS5PtkE0URODGqom?=
 =?us-ascii?Q?AOvB0/WYjGR16ckIkd6RZKm0gpkfXWXoCHcPPRSvG7Gt2CayQtl7409th+JH?=
 =?us-ascii?Q?aBTUxVOpw0SfrNvD4UMegHTclR2qJ4Sk68WRyIZo/MAySkYmD0B75EbozfZp?=
 =?us-ascii?Q?zOxAv2RLoWBWITJCJoY4oMk6EmSJpIfjj+GdYRz0bvTqHNnhVuYeT6CZCzqT?=
 =?us-ascii?Q?FLWhR+oHvCN/6hegdp8ut/PXXgsI6584R9qo4VMTJI7oOZsxrDRcxqTPCSBx?=
 =?us-ascii?Q?bcq2pRwoXLkANqL1kVpa6HMVDYsF1fZo//VuoICE4psOMU0d1o3GqxGpZkrv?=
 =?us-ascii?Q?CHA9TYRGQN6QkKYp2cUqyUGBJ54RzOXp530okHKhjR3a3F+/iCRSZghmLDGc?=
 =?us-ascii?Q?dIU7WuHtBomcAIZpSk4h0A6rKg+A+52oBvaOJlmtTJnrjhf7PllpvXTJeVK7?=
 =?us-ascii?Q?IVZkAZ4J6KqWNIZ9fsTy7tdcBJHAuG4pBqVY0LOIhtUh+z0sbIDr14KQn9AE?=
 =?us-ascii?Q?pWn9pnt1Qo5DKglD+x1mOgC0lCowXrLGEqQQczt70MXaCy+7ZLsMb6vfoUbh?=
 =?us-ascii?Q?g5D3/JbUM6Wm+hVsFKE7uclSVH2eBNS4YIUXgmYjq5U6qTd9TUsnwGO3UmPW?=
 =?us-ascii?Q?l2p20Y34tMDXmiqcXtaN0lEmWF64GOX0XwSZn+98siG9KDVNMcU5X0hoM8fQ?=
 =?us-ascii?Q?6i3h0F45KAGzu50ZKpn3hwkI9H5636jyQ/BTgV1Cb26neEIDtd9z6uP/11eN?=
 =?us-ascii?Q?hbeLxzy1wZcAG3lbYe4QUDdCDl1dRcun8nct2aidWu51V089UimRUpvQTkTJ?=
 =?us-ascii?Q?aGu1hMk1wM/bHDyMfNafiIYFfGkiM1wtlLSAd8ItaFfTO1Wue8axRMVq4+CK?=
 =?us-ascii?Q?Wxd3aQU+bHIZrHm++6YDO5x9jQX3ot+IYtjCuSZ5hGF9kl6UCc+M1ngFdwNU?=
 =?us-ascii?Q?c0P3eg2siMUE6Mpmh3PUj+293oHFdOahY8eAu3HPDpDhg2wiBupFHmb6qYFl?=
 =?us-ascii?Q?9eS0y80miDq4hvxg+lq38JFRpvNVqsthJGH6WcwEZmED3Qr9OBSQwH/cfZbV?=
 =?us-ascii?Q?bO/wjkOvUT5xcD6kFFUGmrZ9Goe5ZxcWA+fEk7kTMJdUVXV8nHJMVTUsVDUS?=
 =?us-ascii?Q?b1btmMAImfyuKr5u46tmf19TrYyEcktkxecKsZUiXxuIOhFLual/InJMqwVK?=
 =?us-ascii?Q?wGfph4jpCdWX2kMCaPRgwHppbE0ZRUawD40GR6MB1XFgo36CWj073cS6+b1f?=
 =?us-ascii?Q?qIUZOhHzCrbo6RkPSL6igU5ZF/cLSAOjO+q6mGt6nup7mtw6xg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DoYHBmJd5n4SChlGxiiJYmuFXPeoN3NUx94tF2yhnLx+mpmyR2hrcrLDHo4P?=
 =?us-ascii?Q?hkylZHZZrKFjMLk9LgiXqj5ht3hvpnIWFNkiPDQgEv/WjDWRp6HuP2ZTINvx?=
 =?us-ascii?Q?8ECQiWqHKiN5CrXLVdUGR33jLPDVjLmA5C9NEFRTczvpHBvZ9X9pH6Wd3wxo?=
 =?us-ascii?Q?TJ9YnZa9fvUzO1FZ3N9t35dNKp+Ln04eAGHgtC8sHgiMq75s+jpzzpuJnDiX?=
 =?us-ascii?Q?9eGXGVgDeh+om6P5Yg4XI9G3kyEA2GGagrt+RE/QtkBVca5gRUf152ft1lva?=
 =?us-ascii?Q?EsSbXzJ8dMDSbHRL42GuTlHqIXzNUyr8SA+qdOVdfdtBFMZS+Xbhla30ptgL?=
 =?us-ascii?Q?/7CXkt7cRjcqNCgGTeF6D1WRiR2YmLpCZq1e8nTKMEr3X3biJOVkqi+0e7cs?=
 =?us-ascii?Q?HkGSOTr0D4fZaktg5TQ4n4dswiXnhvDZVCls6oLinCZVNT2Z7xvPE/EEXY0K?=
 =?us-ascii?Q?vdOEpa0V+C8qG1tTdcultqEFhlTGc6J9TK5gi+1e9WGcqBSx/OQq4pXleXfC?=
 =?us-ascii?Q?ZV/Kq98a4tjSB6MLTopFkj6PIl3ML8C1YAttO7nGlw4B6IfiO8p67KN3VlaY?=
 =?us-ascii?Q?cMTWfADJ+Y6UfMr/PdRlus3sPfIonM5O3nmOK1mqsL0Q2rYF1Vq9lG3G0WwM?=
 =?us-ascii?Q?Oukb9Ub0c1dnKj38G02LraZ4wyM1fJPKIdhH5a2z8bzujoHAmUoP2yWX3IVu?=
 =?us-ascii?Q?KkpQ9g79MDQlhvmgjNzvwksJ9pa6fyWMmugAjbYoAJJb+sLjDpibDdQvu86+?=
 =?us-ascii?Q?LkHSwB1KQq/cfxpf3B4hnIyDfKTJc5I2e20s8DclcJ6yY9Ya7iNTi04aEBkt?=
 =?us-ascii?Q?OsWzBqBNIV2EAttFYffngQ6/dBxhvq/J5lG4NgmMF6NNZCm8tN4ZrW2mPZwH?=
 =?us-ascii?Q?cojjKxAVgQq7SdprUa45Z0UEoFVen3eUKukObFyOCph20htAdJOHNJ/C7q/P?=
 =?us-ascii?Q?7NqPnkx53ZJSaULnT2XDPwnZWFzXpvYZb0Jcb1yaJYiCirhhfyYxg2zfMiDb?=
 =?us-ascii?Q?HaNy5J2RxGPLwFpkSNlYRfDDVQOEWpV9RE4Bbc7xiXOdRY9DHqosSd7sgMLy?=
 =?us-ascii?Q?MqJMEWQr1jPJtJ2Jr7SyeUTeDOWUE1VXbGANAyf2iFZKjLksGmvBiQdWwcpq?=
 =?us-ascii?Q?LoTt7AFV5pxt6RRoB2zKRZIGmmtzKwSqnvvWMHnqpHyonKtCcO7/8MQwFW/W?=
 =?us-ascii?Q?v7j8pi24etMrcKkVqIOvka8OqEp19v3PzP8UFbyPcWIEDOmMiS3iETnDTBUD?=
 =?us-ascii?Q?rRIRUVp7/BQO2y9QVXji9F01uFeInPi7U3zBfTPKhjHgOvbrZaQ1v7CNF7+6?=
 =?us-ascii?Q?4wSL7NFfsicx+0xjdR5qJm19uM+WU4Va4MOZI9ShD/VDy8gE66rXvzjx2+bj?=
 =?us-ascii?Q?aaCOw+xRSDHvd/mNY/NVm+1fgXw2zTVBdwIXUWRrS6B+6qDaECGdihS/2JBM?=
 =?us-ascii?Q?svK3yptH31ELoARRdHBAj27zFVdtTm7PAPGCN666Yx0UFh4NVicVR4t0puVA?=
 =?us-ascii?Q?AjSWySUGJTMEdOop5hnpe1HrwMV6UtPdjtWhjjIDQOcpEZrOW9PvHmAY7FzU?=
 =?us-ascii?Q?qzkbvmhzVJxJ3UXXDxCBBubVUt1vWD+3e/7g1H5cjSxp8AWapYIzgmhkLlV6?=
 =?us-ascii?Q?z+u8fn6rtOesRzKWR3ougcg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0B90E7EA2C045C4A9475A52E71EC14D5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0HHCaAEGYhsrYZdDj80QkeQFnFWa2bDvmy2VPyptVMHeIf9ThPy8shkbItBfXsSfV0EDLbXVGNkwYniSQdoOE4/cpWl9DLNJfIKAoDeeiK3kK3+1RmrjalFPa5vQCmuKWvg07NvcH0MVAWGq7nu/pe369OJJONBo830qQl5g4Rqu/XzsUxlnYyoHG88f+zZkc9EQk0Ndz42iJcAsF07Q4h/rNvvUrhV7qeI3XlusVeFTmeu6BDCwvLZFx1SWipC0i591KlmjsbwkChQOlq/VYSegoDaJrYjigNMkCT8UygyonPYERZ1K7JtAnMbAakZKVeKQ5OcbUUUT36nPte28iGyM/DTmbjl/rZ7bQuPf9HUVznhkC1jjPa0odenb946a92ES6HWZvtQPHvPob263qZDQm7aQ9VT6QzM436AnZ/4vX7ivspXXf/KWnPPq7HhidFqgcZLdWEL8uTX0QRYD6J3LFuaP409XIXVLegvpxnY8GQ7iRyzmTA8mXu/ExYV2Axp1KasBjn1qFiXhe4yslnOnEuoiC69jEyzTj7REbPbblgxPrdUrMkbJF5aJo2Y/WS2wrjfzx/M76bDNpSojqX+3ccEiFjyN7opfeDT/13UjkpW1eTKPbs0G5+Ek8jSb
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f47d04b-d356-4286-ddfd-08dd0f433f38
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2024 00:26:05.3866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzm++WGjTf3VUSxKVctdgMmGVqZS1H+xwGbJ1BXWPG4mN3YS14A57ms/pDaA16yJqKDZjAj2R95MyJgDDJ+jxmreKZmzH7fp6MfmwLn5tGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6811

On Nov 27, 2024 / 10:55, Hans de Goede wrote:
> Hi,
>=20
> Seems I was a bit too quick with reviewing at a second
> look I have found a small issue with this patch.
>=20
> See my comment below.
>=20
> On 27-Nov-24 7:00 AM, Shin'ichiro Kawasaki wrote:
[...]
> > @@ -167,7 +163,12 @@ static int p2sb_cache_resources(void)
> >  	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
> >  	p2sb_hidden_by_bios =3D value & P2SBC_HIDE;
> > =20
> > -	ret =3D p2sb_scan_and_cache(bus, devfn_p2sb);
> > +	/*
> > +	 * If the BIOS does not hide the P2SB device then its resources
> > +	 * are accesilble. Cache them only if the P2SB device is hidden.
> > +	 */
> > +	if (p2sb_hidden_by_bios)
> > +		ret =3D p2sb_scan_and_cache(bus, devfn_p2sb);
>=20
> ret will be returned uninitialized now when p2sb_hidden_by_bios is false,
> so this patch also needs to initialize ret to 0 when declaring it.

Ah, right. Will fix it in v4. I compile tested with KCFLAGS=3D-Wall and exp=
ected
it would catch such mistakes, but it didn't. I found that -Wmaybe-uninitial=
ized
does the check. Will use this check for my future patches.

>=20
> With this fixed you can keep my Reviewed-by.

Thanks! Will send out v4 soon.=
