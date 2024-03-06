Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D71C68A
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Mar 2024 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.154.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709690320; cv=fail; b=mXGryrvaZMxQxu2k8H91FNhuZP/Uou6XUV5zNbMEi7FrR12ONDejwwoSIx260YQOv5IOetNIHsG9sKgn8gvalJxa+YY7cIgIqmlJKP/+AWePJuwHz/YwE2ZxaGsySklumr0HRMdhwuCX+Z658EyHfFYqrqbfQagzY2Eq09s/w/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709690320; c=relaxed/simple;
	bh=PBhCNVVw6sTm5NLh2h+UkdS2L28L4cfhugeMOtYJfec=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X9ZQowXbKTLITJZkzm5t2OaGDOy1wpYopPutoQDA3P2VSuGDdkVUCYY77Ngj5vaIEbWnCduJ++3uDG3aVhfROd+0C4zgoPv9dBWqiP/PlXm1n5/K7cXVmjXjiN2DnoG+D4OdrnqqdY1DqEWkVuyWOVYVDCxD9S3rSkbuXIHfiNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=FHGVm9Xm; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=RhCXSPhF; arc=fail smtp.client-ip=216.71.154.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FHGVm9Xm";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="RhCXSPhF"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1709690318; x=1741226318;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PBhCNVVw6sTm5NLh2h+UkdS2L28L4cfhugeMOtYJfec=;
  b=FHGVm9XmSDwDAYINzUnwcEkdxlJrzOuXE3wRQbQNIW43JHlpwiFp8+sz
   jjcLaziAMyC3uWaxNNLcekj5vx14hgn41+GSxhDZ0z7ri1rV/XhAQposF
   KuODkdxJzVJIQfg29EIJOcBVcmb1nQUfTdlhARZTPGrvivQr2vDoR8hlz
   utVSdePODZqE9OxKaQI8yJ/ApmqLPMZw5TAXO0LQJS5hCei25RqWCRkkR
   rv0HCcekQBAzvXzSSIGZ1Qsan4teF8AAByU5zl2KbH9uwBKMhFMwdvJZ5
   iVK1BkEoCutN44txb9Vr/+tfGIwJ3lDxZ714z94F0ujG838LFwzlDckk0
   A==;
X-CSE-ConnectionGUID: LJ2jhS0OQwijmKcWIDBPrg==
X-CSE-MsgGUID: JG0LXN4RT76+eUqDc6OazA==
X-IronPort-AV: E=Sophos;i="6.06,207,1705334400"; 
   d="scan'208";a="10894777"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
  by ob1.hgst.iphmx.com with ESMTP; 06 Mar 2024 09:58:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJEo/qfL/vC0173vX1yFkkM9Sy/Bgeqr8HOjm7nm1cKoVwQ9bk8KpsEAvEsMO4tiAHWl5SVFDH9jL28UxntKSzKEBQRRyPa38AlXZZxVRWBPKOhSHZEiYbL67uMwKYa9ZEigZmuIu+V7nsKeMMsjxmwSAo7IZ/+omGFkG2LqlTGafbHgiey/n82ZF5w0eIQq4F9vTOJFv6jT5twYIUNAYbcxdWK9Vou0Cd/ZQPKv4p9LxQvUo4chbMNCya21wJG/mGOrkJ3TIwv2LIn6dfr4Jv2SysrV34iq52lhb5YmeOFJfg4pVBKKCsy3yRwrgUBOjfxVqCAGZxuJvLxgkfZEvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBhCNVVw6sTm5NLh2h+UkdS2L28L4cfhugeMOtYJfec=;
 b=C62tw0FPyEOjoWnz+RbWHRGcdnrht2BK2sIE8kWPNqnCYKtrDijYfW8IjBqlsl42uZj/Z5xbCLLrhKO6AU397m2/HDJo0d2dVels39Y9aIvN0VO/8wet2G56ZZlO5dZ2x7DQ4oRORpDrEfHDDSATTFh7WkdZP38a3zpZsOQ2vqy9tFpf+UQyclpMut+7DXbDIj1w9sL6QH89lcffmLrbOYY+H548i7an1dDR3XK6DOfw6XraVS9ClL5UZqFuML7A2vBbflduURRBNreulQBVIo+t2qmPJVD/oCBXnTOoKbg4hmJPtbjIxz9Y89LpP48Qq/eLhuZrEghW7L6SZNO9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBhCNVVw6sTm5NLh2h+UkdS2L28L4cfhugeMOtYJfec=;
 b=RhCXSPhF40BpjiUyeLBoaf7DSWG5iuVsa7Oa+lr8TUeot4+buzwFzTDPwq2j61LmAxpRsOIOvTCS5oXWAO9ll5Lp4AjUySpbm5mbf7N1aXZKcLwthTc1yVoamNAS0+snX/WKQ4w+pM4ok7FHEJrnHZluQLCKi6ELZN69TUXCFJs=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 BY1PR04MB8750.namprd04.prod.outlook.com (2603:10b6:a03:532::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.24; Wed, 6 Mar 2024 01:58:34 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::c9e3:b196:e5ea:909b%4]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 01:58:34 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Hans de Goede <hdegoede@redhat.com>
CC: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko <andy@kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: p2sb: Make p2sb_get_devfn() return void
Thread-Topic: [PATCH] platform/x86: p2sb: Make p2sb_get_devfn() return void
Thread-Index: AQHabuHTBCGdsJvt70e+ejq99g241rEp9dKA
Date: Wed, 6 Mar 2024 01:58:34 +0000
Message-ID: <mkrcd6it2ejerpwpxevq6obxbzz374fh7lc6fltqtxizugoqq2@kwvzznyqmflh>
References: <20240305094500.23778-1-hdegoede@redhat.com>
In-Reply-To: <20240305094500.23778-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|BY1PR04MB8750:EE_
x-ms-office365-filtering-correlation-id: f779e894-836f-405b-5a7c-08dc3d80ee95
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NA0nJjIh6E9TK1sBkyCB2PC6/CnbArR7zlUfEpZGHO7tupkhZ02mqcK9sY1Pr7lwZ0Qvy+r0SsA0esDtjZ/A+U5q6yvyskUnhhUcVK4C0jdzT3LkAJgzb9bfVU+sFMI0lbDYkoozy+Go0NV0/sYLBmjePT2T4SJrOTn4QI6R7HOgwDWIJDr8U7//f9eaHHdZyCIJe/YPvIZc6P9CWrhoVNrcar8VDO0CWeLN+EIW8HjWwKf1fg7EaFDQkLUjJmiUTKMQ6TbCwAZ2KM0rCY6Kv/tQHTvrTHFHKjoDHbV55LvtkF3EI97gkviFBXCzpaZJFrnTB720ia4XKuYTMxE+g6NXxdSqG8ijWRWHxAyAqqgLRRwnYeYr/92lgE+DeNM5kD8wXbXMYCWJGDYjcsaoP21MsJCmRJlh6kOHVkUPApym3WRULd5tzIkPT5lzrxN/xU/KmH4RTXSRAPBV+mT9pCYnkeX8uZIkqwsPP8B2WrrNZELO25Qx7+HcmlxuMp9fjEonqTrdfxjoDn7/Ki7jcOFTZfzZM3K2sqBd3tTcSgrcpepMQuJhXLQFTb4F+6rUbskON7JZho6AnKy7JDBE2aIQYcKzUCWt+b5vjYNcJgdJq+i1e0wURAZX+PlXE5ib0iSAhvNx6/ZQ+gvj19EN3ayruImu7FRptRVwJ3zfnFHCmeRVnmx8yKXAngcvULzsomInJquzB8HvSVsdICZkikisp1EnRO2a98JNvgowJBfgt9fs2Fl8ox+JeiOK5TX6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009)(27256008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Jrpf7DgwlNSRbDBMM578Oy/xCL1YpIu6CCimaoJaB4c1tuFpwPRcR3Of+q?=
 =?iso-8859-1?Q?bTLMRRUOmVstySJ0d/FeYZ4VBZzYlYHh7ng2UWAJ4Su2V3LEYm/39nfoZH?=
 =?iso-8859-1?Q?b03FXrIQTshal36bIOAgRmeOKa+zFO6kx1RZd6sMtfwRlCc7JNcDXvOnoG?=
 =?iso-8859-1?Q?caIi7NgpqK/LZgGXo7vN7hzJJ/m4sVxHI0ZDhm8NEWjrYlTaGjfFf8ziI+?=
 =?iso-8859-1?Q?Zqv6T5kaTSXqw0jvU0zb6I2zgs/pWeLJxzun3k5jp5HH0DeFjvC8Z+yl2o?=
 =?iso-8859-1?Q?vCT8s1J0fqeVP/1y3HD/yxD6nPulngAlhyyFuKmR2yLOt/eXWmC+qJNhob?=
 =?iso-8859-1?Q?L3aw/3cW/2+tEdMRWCj/DB6jA1ii/atvpL4JCqb9TbkHIQBUDFquUXcijk?=
 =?iso-8859-1?Q?MtoZR0Cf6OWi2kmFLVKUOI+zblbMgzjxqo3q6VCtnQPXehIp7DSL/70LX3?=
 =?iso-8859-1?Q?9WD4RCGLNhmWdF+N70SmR4V534EzREcMXmW65/vmMFd0yP172v7HV5Pn27?=
 =?iso-8859-1?Q?4RKd1fAqtNZ9WujQ/PAeyw3IDHxtsdEHXV5k92ZOvTRpkpQZE5lxey8a3k?=
 =?iso-8859-1?Q?3m8BBrgEWT8fpU0D14aEAGrKZqPCOuH9nxYIfWGl7fVAmExl3fc1jkfp0/?=
 =?iso-8859-1?Q?Sg31mDHznBkekElVp3999ci3ccwDUUgBHNpBrLlFjByabJbNU3UCzyx10o?=
 =?iso-8859-1?Q?DeVsogilBLnd2Bn41/t1myGn4U+Reo5XWXddSMhkdQNXW+90nS0qwzHh6k?=
 =?iso-8859-1?Q?7pM9FuJXU6k+jn7Aelpv0/JTkl670+YlpLmUZlbtwCr0J0vD3LqEjXPRON?=
 =?iso-8859-1?Q?y45PaGxKT1mSo7D4PfoAPXWQvuQgYH/c4DT0bY46leOoneenAWtYTme0nC?=
 =?iso-8859-1?Q?RrEl02EbZ7E6nXeyjJGvzvpPh3r7VQPq3RzT60LF1lDDy7bvCwRr/Wa7zB?=
 =?iso-8859-1?Q?mBClogiyL5+8AgVxImY6ePlAAbplI0E01QZx5JCJ50pugX/vVfpH4JrwzV?=
 =?iso-8859-1?Q?wpgm+0iIBIdW8G0V+6qlsWNETLkwRgAAA+WHl0cnOARdzhYEMlU5PkgKRf?=
 =?iso-8859-1?Q?f1yEtY9fcLqZYUn1IUIYOwgj7IHgsZ9EQNBs84D4xUfyURaf+3FE6N0dqZ?=
 =?iso-8859-1?Q?yuZgW9c/PWA9fBsLrbAJitpjB17JnyNUtL8uiYdz+3mO3PzHHHl2XvTfeI?=
 =?iso-8859-1?Q?qrNzU8Qk0XgAC1pLMI/GLnzwVxCB3LpFR9dlnGNQorAJEVoYltc+x46Yb3?=
 =?iso-8859-1?Q?yWgnPlrLuNsTBvawfjlydc63D5SKGPFaQYZuSGfhO1e7UuHEOfVFx2zXbQ?=
 =?iso-8859-1?Q?BOWsb4ua4CTW+aCGcDeYTwO4MtG2ODVBcXRYSlt19AM56wkklLJdTffItB?=
 =?iso-8859-1?Q?oPoKAHFAN4A2cJIodje6tKBlCPOFAcKGYL5LEopkru4mP7rKyM2Q09K6ee?=
 =?iso-8859-1?Q?X2g2qg3QIqPFENhVSUe1MaWYItvfViyTUVaGLl1NL12YDdULgPzwkr6xvQ?=
 =?iso-8859-1?Q?G0MtLTN7mMTkPrkefJa96HwlNVLBibbqqkzf87RUhiu//8pz9XOOvBgIvC?=
 =?iso-8859-1?Q?zV5+j81YVS7GeMXlfLptArpzd3tZDyCxl7ln/mjixPNgJVAGkXh16E6pop?=
 =?iso-8859-1?Q?Huym/+i8yCPjCXF//HtsVuU2NtCIP1LbyrReHaRnipEX8PigxuhUUEBDPZ?=
 =?iso-8859-1?Q?jXBWrYJ4VR6k8a6NBMk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E9CA0EAB97E9C44B94090BED543B69FA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FS/VudanRMrrpn0VwEX7SJI4ggay6Ad6QRVdAKERzGlpz8RESVnS/5JhQ32iOPF7Tk+B8mSNgXaUodJ/0YOBn81PNx8sWGOsFlbVK2jRpyMKUdIvQ/G6JdU/yKEqqpAzsqUGG8IuvzLLnU2GDK3MqmAVRNrc6wPZ9VE7KXkNl72xOTMKAsCzck4ay/RKaDKrSyz5ab3mwzYoiQQDqbJXGxhNQqwQATdA7iD2t7zfuh6bKoAClyz454rm6ORdleNXYJ83KmMuAeDRhZ849lp6vjAXglMdehWAzhIEYFZg6XJpmfF/mEjNYQ9HEBKm+15ck/SzVqVSzOUGmUqF01ID4nFTpNAjo7R/5mvultp4WE486mTbzzxXuuRSAXKbkTDYgAqaK9/NiT1QK6W3V7QpARd7WNopxUZL8gcp1LxrmZFaNGqHDwQ0tMFHbFiXLBQZpFFut9y7ctibXH7PQEoQjxwbZD+eCBB2F6/itsGaONPq5DZhRaasmznoCtJXJe/vkP2S3u2UYAH2QvCjMolnpODw213PEH3goCFvQV/8olh8mwJ7LlMhfRlW+uUE3hXJgKaY8ISxqcCo1gR0dQk+P6DwjENyzHVHzPUdsov790RfugBD7GQs6Q9XwV7Mma6g
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f779e894-836f-405b-5a7c-08dc3d80ee95
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2024 01:58:34.7404
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJSn85lVSWrIoUnOXYfRu78Np0Ral/iqPo7AEGI159lxCezDmUPquTiUceNnQPX/P3BZ6/tAT96YvXKX2sx7TEj0NbyDGhcJoCXqRXoAO1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB8750

On Mar 05, 2024 / 10:45, Hans de Goede wrote:
> p2sb_get_devfn() always succeeds, make it return void and
> remove error checking from its callers.
>=20
> Cc: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Thanks, looks good to me.

Reviewed-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>=
