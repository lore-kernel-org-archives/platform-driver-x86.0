Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0F29CF2
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 05:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.141.245
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732685211; cv=fail; b=h3a5fr8eeJmZJZp2w7Kl5Bifvwt4OxrUTQUFDcO3N/+IiAMhAITbKIYuJRl1HVqN3EWlMH+31vM1EyDfVTUqyXSqD5VNwf3zmwmRXZHYVX36pE4dNhpw/pCoC+eGnbNFkC3M2dhG9GmRf72MjI3nwJ2NeAgyOePYvtZpfGKuR7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732685211; c=relaxed/simple;
	bh=kZotXs4B8sty6WlM1JS0nYZeSIGwP7SASRME2JrmxP8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a9db/GfZNXzPrCKAORNEe+af+34ts2b24bxMDsD7VQOXtu96r8Dpi9La1ejQYU/PUB+5DHiaYpJjaefmaX6ZM5kgFpmJl640ALO8ryJt7o3h4vJupsZvey6OAd5kQ75s0p/6/jwDEBIhIqH47HTE6h/rGODEmHWxb2Jc2H1ten8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=T2TEYELF; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=ZMjWUtSu; arc=fail smtp.client-ip=68.232.141.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="T2TEYELF";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="ZMjWUtSu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732685209; x=1764221209;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=kZotXs4B8sty6WlM1JS0nYZeSIGwP7SASRME2JrmxP8=;
  b=T2TEYELFLtCiezO+t/KTl+4guyhdkr1NXRgSUZRSenJmi/ovOXL6Oglh
   ulllN2ZEGA+2hdSVUbY4ouB8zYBi+r5mfo9DTLwhgJzJdcb/AWtn8stk5
   +y+dRTZTWReJY50RZsOULK8ZYo/gZoyMKznCe4jxDqs1yusYFYeXBeC07
   dmGLthXcKJXQzcAuHZJVHPQETN3+XdjJceICFyJSpO7MZSxDjxJ4r4+s0
   Zh7eROzzOOfm2Ar1XscYaDWxMe4A2V0HfhqCNxnYneHWh6RZJEQnRmPYb
   v39Sp5eefvpU77oUaLzBGyWlAbJknSJBOOwmgtox3+L7WcoLwWqHzl437
   w==;
X-CSE-ConnectionGUID: PjOKyXhwQx+BkxegZpH+BQ==
X-CSE-MsgGUID: LkaQa883TkKC33lILGJ8uQ==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="33507595"
Received: from mail-westusazlp17012036.outbound.protection.outlook.com (HELO SJ2PR03CU001.outbound.protection.outlook.com) ([40.93.1.36])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 13:25:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjYSsaCzpXJk6Vu1rx2xufElNj8NU9rTlQXgobvmf6j6JXxgicDfcQZJ8KPnywb+n5i4/wzMlYCc6liRB4bfQZmxn31X43ZxxBRdfUChFYD9najA+ImAzD94sX37zmXg6p/HbBsxkSjYGoVAFi8IPL1LybCc2jpH0MxX8b8DczBnZkGnFTbMSM9SL1FCfb8q1MwoKuITSwgQcaEDW2TyUD9SP81tDidO5ZXr+iz6fNhzNDBqgek+tgrI2JGvHu3plHHL0XwmcPpitVzHUkHQhyQlbq/790dhgZzcGcpTIkwMoGZ81Wk9BaY4RTyM/d7o3iO4eUS2wBJ+OEReOj2jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqnoniaPVBx0dLtXdsN/WsHux8oEphA1gCP7El4FRMg=;
 b=M3z0u9VFjeNqwWfdUKqXPBdSiAB9D29zzurBArL4SsjBzwPV8Isn2alD2TypK2WU1EZf928gYvCUHVL1apL/TN0uLsuYRQTnLLs3PtZbBLoU5CbeQGUHhHej4InCoK6snT/Hver7BcHkECF8WKCBgr3VflhVNPUIa/ShgA/EbW+SEZcs2xOfvcj8WGsW3at7fEzort3/Ivg4fa1sKecfYk+O/FEQ5qy84Sn8ON4MoTNxjCFM0GOkyX572pjJkMgaelug7teequFviHLeahUn9sv/0VaOA1ZafD1vJBL8cXJ5xT5XYCnV7dNb2xjxPqzseU0gGStg451ltj6I2ZzoFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqnoniaPVBx0dLtXdsN/WsHux8oEphA1gCP7El4FRMg=;
 b=ZMjWUtSugV5kfxBIXjtXCyjfl5ez3GpUCLRz/JIgJwXj0MU/BgJB69tSrK1LhLzgZfARXjglHpDo+LjDI2idPEWHV78D8G2NAAy0CaQhtSY9t6sRnbrel2pyJYQ1040dRZ69uhez9uartDrXqgvRjAAyMBYYi9r7hYCFw8ucz+8=
Received: from DM8PR04MB8037.namprd04.prod.outlook.com (2603:10b6:8:f::6) by
 PH0PR04MB7448.namprd04.prod.outlook.com (2603:10b6:510:b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.21; Wed, 27 Nov 2024 05:25:39 +0000
Received: from DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a]) by DM8PR04MB8037.namprd04.prod.outlook.com
 ([fe80::b27f:cdfa:851:e89a%4]) with mapi id 15.20.8207.010; Wed, 27 Nov 2024
 05:25:39 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"danielwa@cisco.com" <danielwa@cisco.com>
Subject: Re: [PATCH v2] p2sb: Do not scan and remove the P2SB device when it
 is unhidden
Thread-Topic: [PATCH v2] p2sb: Do not scan and remove the P2SB device when it
 is unhidden
Thread-Index: AQHbPvHKmAsas/DoJk2PjQ3LsvuvgLLH1QwAgALGpgA=
Date: Wed, 27 Nov 2024 05:25:39 +0000
Message-ID: <detajl27bni64w2adeiyavkiyp3vvwhtbqh5yjpbnxo2pgyy7e@ryytfh3riwk5>
References: <20241125042326.304780-1-shinichiro.kawasaki@wdc.com>
 <Z0RZMNQGMrZR8BTj@smile.fi.intel.com>
In-Reply-To: <Z0RZMNQGMrZR8BTj@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8037:EE_|PH0PR04MB7448:EE_
x-ms-office365-filtering-correlation-id: 09b6e258-8a51-424d-80ea-08dd0ea3edfd
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?e5UATBu/JDWXh86UbCbP/sr5lYmmfr8y3E0MfN7/9DjEeuRqcUR2OOQQ7pb/?=
 =?us-ascii?Q?e7/n+kL6uUZ2fdeSqnwspXoW/dbXzB++RxLgaF5XXQxbhKl8BXo1Qnvo5Qd0?=
 =?us-ascii?Q?UL6ciqgKUiWC+MbYHGeHi+ATUZCYhYTWjIAmF/MDeMnwZ7NXG+C4pq9U88LZ?=
 =?us-ascii?Q?L4XUWm7gW8IoQmtmOKI5a75w4PlwPBso5G4n1ixlUb0OI031oS0/2CdphxhK?=
 =?us-ascii?Q?YsBxEC0Xf0/Fq4blYetbP1+evxzwWlvL7KOiv1+qcyNvvSYGkei4HDLxs6Hl?=
 =?us-ascii?Q?p5h98C/WB5btaD2y6xyzxU0niObStO/kWpuD6pEVC7Qy3fiWIGrykR957foc?=
 =?us-ascii?Q?FU57edmkSyEm7GFEmnjUkTlzu8NXuB1I1qHQyqhcuoZoUOjzcoWZBP/kVMch?=
 =?us-ascii?Q?dHbBBbTZiiOJxiP6ByosimDO2bRDw+sxRi5rV0xX4NQ3q6rhH9mCntH2mxAf?=
 =?us-ascii?Q?nFvncvlKUqqkeHwdxkiQbcxEf9Q3Lg/1BVSgGn14SiM6cTh3P8h33fbXX9o7?=
 =?us-ascii?Q?KCXVTBoaYL+Fj7mP7qxAdoUZ8YSWLKlzJnYbw10bxLhUPkLkE2bvJTfT/MeV?=
 =?us-ascii?Q?ZT+FBx8LdRrjhjDVQu9J4jJZ3B+zQ38nt9J3NbPlVBGmAKkh0K57MY3K4yBu?=
 =?us-ascii?Q?lOJHQ0O7Jb05q+H+tyvYuUb6bDDVxcf+H2iA45NHKC2kdr9Ig2v3HDUyn8zr?=
 =?us-ascii?Q?ReMFQ1EChC8xhbCDn8zgWh/2Tv7ndfL04tWlauHXmQOixKKtZldroDKhUHn8?=
 =?us-ascii?Q?0t+uriKPJdQgxy60LKgBpDNSxQQ4WEvDvP9G9Na+RgKeemKOUDF3KDEt2Djv?=
 =?us-ascii?Q?fPGzs23OoeF4UExbJi1/OS9kv1EFXOFE0rintrHMevM8pBN9qH6zr9yo71Vh?=
 =?us-ascii?Q?DELZVAbbHwVvXW+O9ECuzJCbADT5e5Lt4mbFoKngaeb4WMCB7iQyYiRk4RTL?=
 =?us-ascii?Q?4N7+Bx4sEvsM/ISFf/fnT8cpPXFAEhaq+OvWUIyoF1CZOk6A/4IInsKtQo8i?=
 =?us-ascii?Q?PWASuK5ObsJIxMSP361MezjVaDWpALzUdFhySYx+/A3qsSKt59o+q93SoXAz?=
 =?us-ascii?Q?z5S6EO0YNqEqnrK2vtBswEiUyZk3bsXgz2w+XSSFLR9wutuWFMnkqvmkJkb3?=
 =?us-ascii?Q?v7X0i5wY8hbSO1u9ah4AqQm6s5E/6WE6ik7OEdlOKxNct27XvcaXUToLeuwl?=
 =?us-ascii?Q?i2ku/ZxIEeFDsPW31MFGNnzJFb3BQok4CD1MpGUbNOiFpvQTBVF8FCqyCBdN?=
 =?us-ascii?Q?iBRr3tmtyXD5DcZEE4mhl4K1IokOuLlCsw818YEvUni53t4P66CEuvn3hVcQ?=
 =?us-ascii?Q?2iGpRz+w7jZfd+qnHcAg9kHT6KtOauboFPKTpPK3M23Pca2CrpdfdlnkYz01?=
 =?us-ascii?Q?GzoqhlPpkGZlW4pKsq4Dj8lLl1axDP+dfT8n4Hs5s8m1EbqW3g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8037.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Sw13dcM65jFmsgH2Y4qW7oe79sTjlBnVvwbldj4flFz0tUkg06jYXwLiAQVv?=
 =?us-ascii?Q?adajvLUbBDmytaouY9nKPkAggByBg8djIbfVuEjPMHwXbPc5wnTIeyNih0LB?=
 =?us-ascii?Q?f9qFZwKydedZnrCJVOgKO+o8xil//GJET3fyDgB0Fp6fyH1TxB4ImzjvFcF0?=
 =?us-ascii?Q?2plVdOF+8RUY2hm/u3mHGmlxxylL5h9XArGfj06FKaXBN3DIEfrmb9I3gYhW?=
 =?us-ascii?Q?NlWw8velCM2j5PqyvX35gVUYUetXUO9ZTWZsDa+1W+IeaMFDuFFVSPvz1LeU?=
 =?us-ascii?Q?U+7lwVyv1+GPo8bhSmKOCoNiFCWnAySjBgFH2NASJucoJAszZnEUL+Csdl8M?=
 =?us-ascii?Q?jjfsy7qAZPankzRTgZ1cAWpZKUwLxUs4eAx+fTWj8DZd7ewqeRVkFpGheusf?=
 =?us-ascii?Q?M7CPIs2hiart1W0hRyDChesZP4CxW5VVHAA2rfPCig8xHFMLZL9uZ6eaUmt+?=
 =?us-ascii?Q?BBHd8upt4hrBRHv5oftA+VIlRPrfoPJe2EVZ/O5vsd6+W8UCMoYySCz6n7nG?=
 =?us-ascii?Q?yZltGf7BO8RmZyjYDsvrpd95/kB31Y07LcfAskkJpbT2ArEoB19hbbpqx3X7?=
 =?us-ascii?Q?gZVClTi2X4R88PrZiuJcrEhvkd209Y+guMguRRTNsj5J/d0p6R8+OtMrs/nW?=
 =?us-ascii?Q?Gmsa0XNSAGCLUf4jsJXMa9XjRWhTOQbRxwTz0owKoSeInQgeFIs4sSN99OSn?=
 =?us-ascii?Q?P6Xa4ETZ3NBc+TaTmpua7xrYzLay+G8Hy4Ixj6VYoh21UKD49V0JuhSRHjOi?=
 =?us-ascii?Q?yWqwM08YBNJHioKp7q4gYaQAZJ65QBlPUv14BlezSCK+HQJxFZOQiWROqOk4?=
 =?us-ascii?Q?je+mte3jxOkyqUuMauQwK35Zyx0xiq+eJdc/iFkRA/k84ryLCS4sL44U9eu7?=
 =?us-ascii?Q?EVrOXYaRuFdA8E8PLTTmU6pfayNKJ3sfQcbF9KgEYkZXXMUxPXbBMDI7c3Ch?=
 =?us-ascii?Q?8Vzon9iVSsvAMESIy/dir2Vfw+i1qlPN1qUm2p4DfbmwNV4G+vI+m/8t/a6f?=
 =?us-ascii?Q?ZZdCo8sn+zXqvb2uokfiarU/FdYy6l8ID4NuadWzJPbShVyOd49KBD2JcZoD?=
 =?us-ascii?Q?XnHS0+jrtgtyCptGHY76MYhVW6HlRFmlLqTGGnA9OWloQz/+60zr0QVnZ4i4?=
 =?us-ascii?Q?3icqVv2nSHK6CJcPSyREei/jmFThl9U62OxYRzUNBsr7TmK9JquB+q+iaOX0?=
 =?us-ascii?Q?ROyxyz9iSCsnqKF2E+q7a5DIKZno/MxbAHJUfYZw7sWNQu2jS5CtYUDWsQOK?=
 =?us-ascii?Q?BUyEa92Hjk245l97nOhDFdTciVEy+ykVdc9bVxgIh301t3R0/1aNpoqMBDV+?=
 =?us-ascii?Q?LA76D73mGHAMKUtoiJh1S6Pl0HkCkcGQ8wuJd+ua6XrYkOC0bdt0vRi9D/rC?=
 =?us-ascii?Q?20TV0j9W+Yj3wHgMRK3JwklKhtGBownMkpxImhFvMHfHcv19ZRTQsKEIRleL?=
 =?us-ascii?Q?x0ii0b8w+0aEE/MEC/ugZu0fwT1XxKTFOKHNdBmAj71rl/cTKj33rr/t0xjy?=
 =?us-ascii?Q?crSSew6vFooLIejcJ3SrZeGPtUl8UDInTkjPig+PTKbbiYmpI39g+rc9Az7o?=
 =?us-ascii?Q?DH00wfOvnJh+CAlopgVR9W9aBCfdTNAeWemsX4CVT+PF4MIjF4q0GyTnuecp?=
 =?us-ascii?Q?SCYGfX7A3S+B/bLfBAxPeDg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38688B920372E847B60BA6ABF9A0CE70@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T00mKim/kMf4/nuGIFceYkeamMPJWoPOA6kUl0+oRnUtTyRSkJ51O2Hal1eVmC8IDhs/ZP3T8Rwwz8+mKzsaPGkZq/ATX52KKQC/us3lY4uY1oS7PHh+4xTRYJEipiVTbH47mGHykpHnZ9ctsWFZlqs+DYaMpLqDdVQkVUKmfuKb1wBkaOnZN57I+jTW71bcmalCJ2OeNW9ken7neEdf5PMvEAOaQT3CoKoCVlkbV6Vv5VxdqU7WXYSt9oUMaMRkM34x/gFs5qi/T5fjljdcN7wrizblAOw8HxaVlr7kf07d+CwctXO17nbRGqTl/8Kqvkyj+29kEIzMpEsbyro3ymr36/3dIo1EqPsAonXKSh9vo8WkbHZ8EcHiWuXLY1baeZASMqTFxgLJlgqslFjAMff+LDGehuRxMrn1vBipKyKwjzpVkFJShp/rfldpgeOCOIIWx7NvBeGl9HZtin5eCqLJNw/NNduHjtQoMkkCf+ZOwC0Q2uXWlYE7FEkG1DfVQJToLudW7Nw7KLDeu+i2yFw27V6+nSdNmDiKBpgkNBFGMQ4NG6hW5NV9hCGVarjCWVZygY+ijfO2LqciYMZL+5Hm4Y7p10ne9vhlriJrDhAr6N5/KGbTLTO4XvgyBMQ9
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8037.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b6e258-8a51-424d-80ea-08dd0ea3edfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 05:25:39.1374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfdfMpr1CKPCD3zoCqK8fnM31QbLlBmS45GPf8YlORWtnPI3LhDdLQby+viia+Pv+bEKXrjYqN9NXw3R7LAE1l9wVP68pa7gTc84GaC9+x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7448

On Nov 25, 2024 / 13:02, Andy Shevchenko wrote:
> On Mon, Nov 25, 2024 at 01:23:26PM +0900, Shin'ichiro Kawasaki wrote:
> > When drivers access P2SB device resources, it calls p2sb_bar(). Before
> > the commit 5913320eb0b3 ("platform/x86: p2sb: Allow p2sb_bar() calls
> > during PCI device probe"), p2sb_bar() obtained the resources and then
> > called pci_stop_and_remove_bus_device() for clean up. Then the P2SB
> > device disappeared. The commit 5913320eb0b3 introduced the P2SB device
> > resource cache feature in the boot process. During the resource cache,
> > pci_stop_and_remove_bus_device() is called for the P2SB device, then th=
e
> > P2SB device disappears regardless of whether p2sb_bar() is called or
> > not. Such P2SB device disappearance caused a confusion [1]. To avoid th=
e
> > confusion, avoid the pci_stop_and_remove_bus_device() call when the BIO=
S
> > does not hide the P2SB device.
> >=20
> > For that purpose, cache the P2SB device resources only if the P2SB
> > device is hidden. When p2sb_cache_resources() is called, check if the
> > device is hidden and store the result in the global flag p2sb_hidden.
> > Check the flag in p2sb_bar() and if the device is hidden, refer to the
> > cached resources. Otherwise, read the resources from the unhidden P2SB
> > device.
>=20
> ...
>=20
> > +static bool p2sb_hidden;
>=20
> I would call it p2sb_was_hidden or p2sb_hidden_by_bios.

Okay, will rename it.

>=20
> > +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
> >  	ret =3D p2sb_scan_and_cache(bus, devfn_p2sb);
> > +	pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
>=20
> We already pass the devfn_p2sb to that call, perhaps you can simply move =
these
> configuration writes there?

I see, will move the two pci_bus_write_config_dword() calls to
p2sb_scan_and_cache().

>=20
> > -	/* Hide the P2SB device, if it was hidden */
> > -	if (value & P2SBC_HIDE)
> > -		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
>=20
>=20
> Thinking of how this change is done, I'm wondering if we better split it =
to
> some preliminary refactoring to make it clearer of what's going on on eac=
h
> step. Note, it's not a problem to have a series of patches to fix somethi=
ng and
> it does not rarely occur (I believe Hans had done this many times in the =
past).

I see, I will try it with v3.

>=20
> ...
>=20
> > -	cache =3D &p2sb_resources[PCI_FUNC(devfn)];
> > -	if (cache->bus_dev_id !=3D bus->dev.id)
> > -		return -ENODEV;
> > +	/*
> > +	 * If the P2SB device is hidden, refer to the cached resources.
> > +	 * Otherwise, read the resources on the fly.
> > +	 */
> > +	if (p2sb_hidden) {
> > +		cache =3D &p2sb_resources[PCI_FUNC(devfn)];
> > +		if (cache->bus_dev_id !=3D bus->dev.id)
> > +			return -ENODEV;
> > =20
> > -	if (!p2sb_valid_resource(&cache->res))
> > -		return -ENOENT;
> > +		if (!p2sb_valid_resource(&cache->res))
> > +			return -ENOENT;
> > =20
> > -	memcpy(mem, &cache->res, sizeof(*mem));
> > -	return 0;
> > +		memcpy(mem, &cache->res, sizeof(*mem));
> > +	} else {
> > +		pdev =3D pci_get_slot(bus, devfn);
> > +		if (!pdev)
> > +			return -ENODEV;
> > +
> > +		if (p2sb_valid_resource(pci_resource_n(pdev, 0)))
> > +			p2sb_read_bar0(pdev, mem);
> > +		else
> > +			ret =3D -ENOENT;
> > +
> > +		pci_dev_put(pdev);
> > +	}
>=20
> Can you split these two branches to two helper functions. In the result i=
t will
> look better in my opinion.

Okay, will do. Thanks for the comments.=
