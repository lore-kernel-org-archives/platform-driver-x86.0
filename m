Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E67033F5B8;
	Fri,  3 Jul 2026 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067147; cv=fail; b=RSM+Al7b7y9SqWhHjp7quxQVh10p5O1R02IkS1Y3iaUjkpywNlYtN0+lfXw4N0dJBsyp3VnyelicatkOQMv18nmN7jVJSaFPdgO8XriTH1HCOJKIPEw9ToDaLLqph6V7/ZZQncNGhs50eB06iPefikWi7sO00h/dLGN6czNd6M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067147; c=relaxed/simple;
	bh=S+1xpROt6xjZg3yPGFh1ZSh6bLx8uA7DgWt6EDi+Awg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s0HgjuhbzK0ADOLno7qsc+DIlBoqLS9r8KgbjE0GE5UgjxHQPIXkNGHfWxvDg7VBApkt7VV8oQvWi6tg2PRmRfqNwfQ2NvPcRON9+/V5emJ9H49me1J6EppIWnlkeGKQoUDYouEgM6qwY8I1tYce0CS01BITyjeCF1J0VdtJTpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Smq1G8KU; arc=fail smtp.client-ip=52.101.193.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Smq1G8KU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cuewy2n6HIo7JbVv2EYtUv6YJ2wBWHkkKqHeeCkublKF2eSqA+6wffT8VvzsnszQNPlRLETGtQSEZ/BgEylboxzWNpJuM4CG0/2YF9aJh4Jh5P6NzX57jiy++NrmTaaeybjMOda1M6CWkSdM6vwdCO6/MDSeP9cXNBwwfzbTgv3YxM1sMsJ19T+moqa7Xmsvlle//TSKrU+z0X7lSSirIBUzUGvtlRfOsTsskorfKxDces5XBu+1R943XjmUFN3j9RaCzFEtAYDKmFW34MPaqq3ahh6Lyrbm7iAbQ3W9mzFKBC8/WOckIJDM/k+SVseXBGcnPDUp084q/VPAR6OENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFuBrlIwESQBcfBBQ7C86Rphj2zEJ5z9m340Tg6x55o=;
 b=QQ/iMynMp1W9Bqk1bPVIFpDD/Vg2gndAED0pkZMMxhQXeG0FuKJFpm6IHMv573dlNbF9dQvfRs58fJnCZn0q3U9oijI+v8QOEMRy6DmWKW4y3YZCFM4u3CWP1pitX2QZwbyluZCVK+iTUIO0qQ/DV9dSJVqv7jhs8+T7tFuiO+wV0YBnAyHSjXwvnGQHgLeOtIhzXvadBye3wrRt4142USDvWd3ClNDqkbuyK1V0LcfCYrCBa35e8OJYk11X/i5NNJMQDs5yKW3yET4WBTi9aeEwhLGqU6pJ83jpdEwaeIdBqUlmhO0jogfbwShHLp682PSCsVQxxrqSp8k2yR8AGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFuBrlIwESQBcfBBQ7C86Rphj2zEJ5z9m340Tg6x55o=;
 b=Smq1G8KUR687XUX5HNx6uaL7SBcgsB3HNma9ENt3OzyyjXq4XPG66N4SkwnP9fCfuVEXLB8rJ2/gXiKQ1aEUMFlMzJTe6Hor+282cn1H6HTiWZC7PYOjKvn8jplBONxaa1gTfDEyLZKbbmPj7P1VikJZjcv9KygK2FbB6mtmGDo=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 08:25:42 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 08:25:42 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: Hans de Goede <hansg@kernel.org>, =?iso-8859-1?Q?Ilpo_J=E4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Topic: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Index: AQHc+XyiNDa9Kmyi/ka1j3CoAJIIEbZblUz0
Date: Fri, 3 Jul 2026 08:25:42 +0000
Message-ID:
 <DS0PR12MB84794FC17FDBFB548FCB33B3FEF42@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com>
In-Reply-To: <20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-03T08:25:41.613Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|SN7PR12MB7977:EE_
x-ms-office365-filtering-correlation-id: a2d44182-4ba2-429d-effe-08ded8dcabec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|38070700021|6133799003|11063799006|5023799004|56012099006;
x-microsoft-antispam-message-info:
 SpHdMEFaZbMEmr2LbjfWmFUIwm9T38s74iZKc4W/CEDNpGUk0L8zgV8rO1vmHgTSev2tPAtaqSC2VG6WnyrZx9IrD4CZI5VoACAmd0fNvpNRpsrVBSx43M84F0pG4tACOL+P4PKDjx+vje7j3oTFDF7D69JlV0TTqtn6BH7ur6lWMYHHEjC4QgrkfCGF/dFZV/6g1xVGugG/1LwH/2mDWJ4hlXYLZbDawY18u7cpfGthJOQLqOwQitDL52Wn5vIwe/6DdJbGzWvKOQV+05EjUUNH0+kyEmgI99qSlj0dv5dWDN4yhPhjDc45KjATPyXKhO3aczMmQ9aAR/i1wyYXcv/xe3hERITraZBmhK8jllVOsF84zPebRko9XZzUNIjLxu2dfr3ZNxH7JxYRbZT6B6r6YggeAB02VdgXJcY5EeO2nibQ+qwrNoax5ItodkHyYY/6Hq7FjCy48PDCrTcDDgUB6XF4toHA6AxgM4AxZz59ULG4uQzfTP8aO8juw5Dw63bQzKF0X5STurB67tSi6QXLpiJfLWp+QS8XIuJG4RZ7e1tLPiex0BMYyEyYgK4IV7kKqc5gw8IoS40LMm3/HvDeVVI6z+AHV5ecuUV5VXoZfK3H0dTyWM1uVtoGGiVoWJX8ga/t8yQlklCnTHKepZKr9ay/iVWk/i7tWakWfnv3FptyZQqLfwL/K1L9JlIBU+lXHTviWJ0R9EghR0CgWXerPq5KNAW+bUggJ39KY8M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(38070700021)(6133799003)(11063799006)(5023799004)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jdPb9E2a5JAgtPrFDzDpl5BORaF6M+OOFWD1H304fGQEIWkROW04HqOTZj?=
 =?iso-8859-1?Q?Nf+gW20kHzN0qDYl6XnnXSXvkJ3J2DtPZv0+vp4ry8bE4XxaaCHwFwzmd0?=
 =?iso-8859-1?Q?DUZgzzLbGsIquTdIyYnpvGTw6V4wai/SzQZROwpnDz8RoLYs++hE4xb2jQ?=
 =?iso-8859-1?Q?W+cI4DFEaj/QRLJNZD3qM+ewXCBxgqZLbfeJVE/G5y4xH9LJHORT97ZI1I?=
 =?iso-8859-1?Q?yZiDQt/eXsKc3ZFcziV7ZUBQE7TsLMAJZk9BKQWLB+wh6bIiElq6zTEEgI?=
 =?iso-8859-1?Q?IDl6shrh2yfr7DVVEGfU2fNAuFqXFRet+YT4gQS/PyMIf3C+vtlq5fm2jT?=
 =?iso-8859-1?Q?UiqZ4wyWAXWcKlCoxJW7kJPtRwn/ywBwc38sa+d/oO+gIhlA7KR6NwkV09?=
 =?iso-8859-1?Q?OSUFYTy4i9CeJRJHedymRIizJVQ7+zdmkOAQLYGohyqXvwKFz0NysUDRIF?=
 =?iso-8859-1?Q?QXQi+Ys/Ah6s15IsvpwR3OqjZlmILa+yG+k9k0LH/QvhS77XF9qPH7Zlzg?=
 =?iso-8859-1?Q?vrPOFWDt3HCmw2nJTzfsEAtXx0ew8xKb+IC94rbKiNZGFZFLhrni4wmSw+?=
 =?iso-8859-1?Q?wbneNI2BQeSFTXLxyRFqSfGmEXYsuVH0P55PK+rQVXbdpwCUdCM2TJfAz5?=
 =?iso-8859-1?Q?oLUfD0DIV1fuPuMewMZ9V3QC/cVWYpoDYYQyB114QLhaWlMhl0jIWpxH6K?=
 =?iso-8859-1?Q?/ERExLW/E7HywQnbK46JL7GaxF5aFjOu+8VV5d4IHh3eOHSYTYP0NEnoEn?=
 =?iso-8859-1?Q?Dqcq/PC/3nWIIIwM1eE42AqM1sihbbaWnEIL2agT+MYxV1rRWdJAUtn8Lk?=
 =?iso-8859-1?Q?P1bJPlg5xiHspyQ69bl92Fdpwstrbs6BIOwo/THdOzxXe1zJBXY0zxcLVt?=
 =?iso-8859-1?Q?G9XEAWHXQfG2kgN8/XAXuIo2n1UGQSDt50bqQMLCIXKjBU6dALWP2sQQwm?=
 =?iso-8859-1?Q?mEHwpYT0A+4COEBpYks17QgWUHtGX1ex97rceeLd9T85wkIQyGBZRu65pH?=
 =?iso-8859-1?Q?IaYWorLwPMeOB+lXuxWNSQIGy3U4H+cocBn7jMjbmJRGg6i3eC3GNCCQFN?=
 =?iso-8859-1?Q?y3+wPCKqQ5sy9t0o17P4JGX4+ZGdZt6Gery+VtESpCj6Ks6A+r5weZbYHx?=
 =?iso-8859-1?Q?paYUD9R5XkCNX0hMfrAHCG8Ho84bGwMnYhmzU2y8Dvtl/HzIrm0WNbJElM?=
 =?iso-8859-1?Q?7afHuUiiQLsH/bXkHBLQIh/EdW1qFXb1qnx51OOognsnt3/vlah4yqcbC/?=
 =?iso-8859-1?Q?8oDiSKiL/1yfSeU3w37+wVSZZnJhh100NvgeOpkJ/BUDosP6SGezN0YXGQ?=
 =?iso-8859-1?Q?gu4c6NEmaAS6NzV7wBck2XydK7Es3QuGf1p7ZXYD0TgOXfP7J7/bd5I2TV?=
 =?iso-8859-1?Q?kA23omtkNn/wLTTZMQRLhOjpNMwArVdft3cqf3LBhm2SirsttjbDBR6Dcz?=
 =?iso-8859-1?Q?GQHWgSUnkhnH/JKL/QNZVCq+zAFjW5N+7p4yv6qkTgdphLpCBbDGPHUeKz?=
 =?iso-8859-1?Q?k6xi7ghK9q1k/4PxwcOYB9bH7pVftZaPrUFjhgFcREWnYVnokgsO+D+MtX?=
 =?iso-8859-1?Q?SBrwS271R9cGBIUBAAjAyw7ONPr+ipHVICuNZhj0GnmEAOeqavmZnj6EJL?=
 =?iso-8859-1?Q?hTiRiL8dzzLB5FnLRKzducrlkOTWCYqngV9UkAp/h3JzmEgWeT0JJWiBiT?=
 =?iso-8859-1?Q?7ISiDvJFGmyJfVhyfUEDoT0FttJfCwIkhLfSQNblBkpUff7IJwtAsQsOee?=
 =?iso-8859-1?Q?kKZP9DTzaw2CLIOMXfnlm33P4wTA+pn7Zm6n5me7Ak5HHv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8479.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d44182-4ba2-429d-effe-08ded8dcabec
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 08:25:42.1118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OSRgijtKaxcPLFdcIZc805lvT+pH0n+pzX5W4iMQsj+OnAiuEbCm5ME4jHe9U+1H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

Hi Ilpo and Armin,=0A=
=0A=
> =0A=
> =0A=
> =0A=
> ________________________________________=0A=
> From: Lin, Leo <Leo.Lin@amd.com>=0A=
> Sent: Thursday, June 11, 2026 4:30 PM=0A=
> To: Hans de Goede; Ilpo J=E4rvinen; Mario Limonciello (AMD); Lin, Leo=0A=
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; S-=
k, Shyam-sundar; Armin Wolf=0A=
> Subject: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver=
=0A=
> =0A=
> The Halo Box features an RGB LED light bar that can be controlled=0A=
> through WMI methods to display any color combination.=0A=
> =0A=
> The driver exposes the LED through the LED multicolor subsystem,=0A=
> allowing userspace to control RGB values via sysfs:=0A=
>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity=0A=
>   /sys/class/leds/amd_halo:multicolor:status/brightness=0A=
> =0A=
> Hardware interface:=0A=
> - Three separate RGB channels (Red, Green, Blue)=0A=
> - All 3 channels are configured at once with a single WMI method call=0A=
> - Value range: 0-100 (matching hardware range directly)=0A=
> =0A=
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>=0A=
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>=0A=
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
> ---=0A=
> Send this patch revision because we now have better BIOS behavior which=
=0A=
> allows us to remove of some hard-coded logic in the driver.=0A=
> =0A=
> There used be a BIOS behavior where WMI values don't correctly reflect=0A=
> LED colors after S5. Setting known default values to LEDs on probe is=0A=
> a compromise for that.=0A=
> =0A=
> That has been fixed in our new BIOS, so we no longer need to hard-code=0A=
> the default colors in the driver.=0A=
> =0A=
> v6 -> v7=0A=
> - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and=0A=
>   read them on probe.=0A=
> - Remove hard-coded RGB values.=0A=
> - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-b=
7bf7b904a16@amd.com=0A=
=0A=
I tested v7 after rebasing it onto the latest platform-drivers-x86 tree (HE=
AD at dc59e4fea9d8), and it still functions as expected. It's a clean rebas=
e, so this patch should still apply cleanly on top of your tree. Can you he=
lp review this when you have time? Thanks.=0A=
=0A=
BR,=0A=
Leo=0A=
=0A=
> =0A=
> v5 -> v6=0A=
> - Add missing includes and sort/group them accordingly=0A=
> - In __amd_halo_wmi_call, remove some unnecessary intermedaite variable a=
ssignments=0A=
> - In __amd_halo_wmi_call, move declaration of pointer managed by scope-ba=
sed cleanup=0A=
>   helpers closer to where it is used=0A=
> - Add trailing comma to designated initializers=0A=
> - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-4=
97dc9719a18@amd.com=0A=
> =0A=
> v4 -> v5=0A=
> No code chang. Only email etiquette fixes=0A=
> - Fix the "From: " in the mail from leo.lin@amd.com to Leo.Lin@amd.com,=
=0A=
>   so that it matches s-o-b=0A=
> - Pull the Reviewed-by trailer from previous threads.=0A=
> - Link to v4: https://lore.kernel.org/r/20260521-halo-leds-v2-plus-v4-1-b=
498bbab36a2@amd.com=0A=
> =0A=
> v3 -> v4=0A=
> There's a new WMI method we introduced in BIOS for color setting, to=0A=
> replace the original ones, so in this version:=0A=
> - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1=
=0A=
>   command argument (GET/SET) and 3 RGB values. This method is capable of=
=0A=
>   turning on and setting all RGB channels at once in a single call, reduc=
ing=0A=
>   some undesirable visual effects when setting them separately.=0A=
> - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.=0A=
> - Remove implementations of unused WMI methods.=0A=
> =0A=
> This version also fixes things pointed out in the previous version:=0A=
> - Explicltly specify the endianess of WMI arguments as __le32, and use=0A=
>   endian-conversion helpers accordingly.=0A=
> - Use scope-based cleanup helper for WMI buffer.=0A=
> - Remove cleanup for channel setting WMI in probe.=0A=
> - Explicitly include headers for kfree and le16_to_cpu=0A=
> - Fix white spaces=0A=
> - Fix designated initializor style=0A=
> - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-9=
1df458966ea@amd.com=0A=
> =0A=
> (Didn't pull Shyam's Reviewed-by because this is a relatively bigger chan=
ge.)=0A=
> =0A=
> v2 -> v3:=0A=
> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method=0A=
> - Explicitly call the ON method on brightness_set callback for=0A=
>   brightness !=3D 0; call the OFF method when brightness =3D=3D 0=0A=
> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally=0A=
> - Replace get_unaligned_le64 with casting and le16_to_cpu()=0A=
> - Add an inline function (wmi_status_to_err) to convert WMI return=0A=
>   values to errno=0A=
> - Use amd_halo_wmi_set_channel in probe to set default color=0A=
> - Use devm_mutex_init() instead=0A=
> - Remove unused includes=0A=
> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-a=
f027727605b@amd.com=0A=
> =0A=
> v1 -> v2:=0A=
> - Fix Kconfig dependencies=0A=
> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0 wi=
th the=0A=
>   same logic where brightness !=3D 0=0A=
> - Remove the brightness_get callback, because currently there isn't a=0A=
>   well-defined global bightness in hardware. Note that the sysfs brightne=
ss=0A=
>   stil works. It just caches the value last set.=0A=
> - Convert to wmidev_invoke_method()=0A=
> - Convert to ARRAY_SIZE()=0A=
> - Convert some macros to enum=0A=
> - Convert to devm_led_classdev_multicolor_register_ext()=0A=
> - Rename sysfs path to amd_halo:multicolor:status=0A=
> - Fold default LED colors setting in probe, before registration=0A=
> - Add no_singleton option=0A=
> - Make default RGB values into macros and adjust their values=0A=
> ---=0A=
>  MAINTAINERS                             |   7 +=0A=
>  drivers/platform/x86/amd/Kconfig        |  11 ++=0A=
>  drivers/platform/x86/amd/Makefile       |   1 +=0A=
>  drivers/platform/x86/amd/amd_halo_led.c | 322 ++++++++++++++++++++++++++=
++++++=0A=
>  4 files changed, 341 insertions(+)=0A=
> =0A=
> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
> index b539be153f6a..6450962b003e 100644=0A=
> --- a/MAINTAINERS=0A=
> +++ b/MAINTAINERS=0A=
> @@ -1130,6 +1130,13 @@ F:       drivers/char/hw_random/geode-rng.c=0A=
>  F:     drivers/crypto/geode*=0A=
>  F:     drivers/video/fbdev/geode/=0A=
> =0A=
> +AMD HALO BOX RGB LED DRIVER=0A=
> +M:     Mario Limonciello (AMD) <superm1@kernel.org>=0A=
> +R:     Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
> +L:     platform-driver-x86@vger.kernel.org=0A=
> +S:     Supported=0A=
> +F:     drivers/platform/x86/amd/amd_halo_led.c=0A=
> +=0A=
>  AMD HSMP DRIVER=0A=
>  M:     Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>=0A=
>  R:     Carlos Bilbao <carlos.bilbao@kernel.org>=0A=
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/=
Kconfig=0A=
> index b813f9265368..a1a74ef6c859 100644=0A=
> --- a/drivers/platform/x86/amd/Kconfig=0A=
> +++ b/drivers/platform/x86/amd/Kconfig=0A=
> @@ -34,6 +34,17 @@ config AMD_WBRF=0A=
>           This mechanism will only be activated on platforms that adverti=
se a=0A=
>           need for it.=0A=
> =0A=
> +config AMD_HALO_LED=0A=
> +       tristate "AMD Halo Box RGB LED Driver"=0A=
> +       depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR=0A=
> +       help=0A=
> +         This driver provides RGB LED control for AMD Halo Box devices=
=0A=
> +         through the LED multicolor subsystem. The Halo Box light bar ca=
n=0A=
> +         be controlled via sysfs to display any RGB color combination.=
=0A=
> +=0A=
> +         To compile this driver as a module, choose M here: the module=
=0A=
> +         will be called amd_halo_led.=0A=
> +=0A=
>  config AMD_ISP_PLATFORM=0A=
>         tristate "AMD ISP4 platform driver"=0A=
>         depends on I2C && X86_64 && ACPI=0A=
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd=
/Makefile=0A=
> index f6ff0c837f34..2f467dbbfc8a 100644=0A=
> --- a/drivers/platform/x86/amd/Makefile=0A=
> +++ b/drivers/platform/x86/amd/Makefile=0A=
> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)         +=3D pmc/=0A=
>  obj-$(CONFIG_AMD_HSMP)         +=3D hsmp/=0A=
>  obj-$(CONFIG_AMD_PMF)          +=3D pmf/=0A=
>  obj-$(CONFIG_AMD_WBRF)         +=3D wbrf.o=0A=
> +obj-$(CONFIG_AMD_HALO_LED)     +=3D amd_halo_led.o=0A=
>  obj-$(CONFIG_AMD_ISP_PLATFORM) +=3D amd_isp4.o=0A=
>  obj-$(CONFIG_AMD_HFI)          +=3D hfi/=0A=
> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/x=
86/amd/amd_halo_led.c=0A=
> new file mode 100644=0A=
> index 000000000000..824d3f7d680b=0A=
> --- /dev/null=0A=
> +++ b/drivers/platform/x86/amd/amd_halo_led.c=0A=
> @@ -0,0 +1,322 @@=0A=
> +// SPDX-License-Identifier: GPL-2.0=0A=
> +/*=0A=
> + * AMD Halo Box RGB LED Driver=0A=
> + *=0A=
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.=0A=
> + *=0A=
> + * This driver provides RGB LED control for AMD Halo Box devices through=
=0A=
> + * the LED multicolor subsystem. The Halo Box light bar can be controlle=
d=0A=
> + * via sysfs to display any RGB color combination.=0A=
> + */=0A=
> +=0A=
> +#include <linux/array_size.h>=0A=
> +#include <linux/cleanup.h>=0A=
> +#include <linux/compiler_attributes.h>=0A=
> +#include <linux/container_of.h>=0A=
> +#include <linux/dev_printk.h>=0A=
> +#include <linux/device.h>=0A=
> +#include <linux/device/devres.h>=0A=
> +#include <linux/led-class-multicolor.h>=0A=
> +#include <linux/leds.h>=0A=
> +#include <linux/module.h>=0A=
> +#include <linux/mutex.h>=0A=
> +#include <linux/slab.h>=0A=
> +#include <linux/types.h>=0A=
> +#include <linux/wmi.h>=0A=
> +=0A=
> +#include <linux/byteorder/generic.h>=0A=
> +=0A=
> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"=0A=
> +=0A=
> +/* WMI method IDs from MOF */=0A=
> +enum {=0A=
> +       AMD_HALO_WMI_TURN_OFF =3D 0x04,=0A=
> +       AMD_HALO_WMI_RGB =3D 0x07=0A=
> +};=0A=
> +=0A=
> +/* Arg0 of the AMD_HALO_WMI_RGB Method */=0A=
> +enum {=0A=
> +       AMD_HALO_RGB_CMD_GET,=0A=
> +       AMD_HALO_RGB_CMD_SET=0A=
> +};=0A=
> +=0A=
> +/* Status codes from spec */=0A=
> +#define AMD_HALO_STATUS_SUCCESS                0x0000=0A=
> +#define AMD_HALO_STATUS_INVALID_PARAM  0xFFFD=0A=
> +=0A=
> +/* Brightness uses 0-100 range */=0A=
> +#define AMD_HALO_MAX_HW_BRIGHTNESS     100=0A=
> +=0A=
> +/**=0A=
> + * struct amd_halo_led_data - Driver private data=0A=
> + * @wdev: WMI device pointer=0A=
> + * @led_mc: LED multicolor class device=0A=
> + * @subled_info: RGB channel information=0A=
> + * @lock: Mutex to protect WMI calls=0A=
> + */=0A=
> +struct amd_halo_led_data {=0A=
> +       struct wmi_device *wdev;=0A=
> +       struct led_classdev_mc led_mc;=0A=
> +       struct mc_subled subled_info[3];=0A=
> +       struct mutex lock;      /* Protects WMI method calls */=0A=
> +};=0A=
> +=0A=
> +struct amd_halo_wmi_args {=0A=
> +       __le32 arg0;=0A=
> +       __le32 arg1;=0A=
> +};=0A=
> +=0A=
> +struct amd_halo_wmi_args_rgb {=0A=
> +       __le32 cmd;=0A=
> +       __le32 red;=0A=
> +       __le32 green;=0A=
> +       __le32 blue;=0A=
> +};=0A=
> +=0A=
> +struct amd_halo_wmi_output_rgb {=0A=
> +       __le16 status;=0A=
> +       u8 red;=0A=
> +       u8 green;=0A=
> +       u8 blue;=0A=
> +} __packed;=0A=
> +=0A=
> +static inline int wmi_status_to_err(u16 status)=0A=
> +{=0A=
> +       switch (status) {=0A=
> +       case AMD_HALO_STATUS_SUCCESS:=0A=
> +               return 0;=0A=
> +       case AMD_HALO_STATUS_INVALID_PARAM:=0A=
> +               return -EINVAL;=0A=
> +       default:=0A=
> +               return -EIO;=0A=
> +       }=0A=
> +}=0A=
> +=0A=
> +static int __amd_halo_wmi_call(struct wmi_device *wdev,=0A=
> +                              u32 method_id, void *data, size_t length)=
=0A=
> +{=0A=
> +       struct wmi_buffer input =3D {=0A=
> +               .length =3D length,=0A=
> +               .data =3D data,=0A=
> +       };=0A=
> +       struct wmi_buffer output =3D {};=0A=
> +       int ret;=0A=
> +=0A=
> +       /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) =
*/=0A=
> +       ret =3D wmidev_invoke_method(wdev, 0, method_id,=0A=
> +                                  &input, &output, sizeof(__le16));=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       __le16 *result_status __free(kfree) =3D output.data;=0A=
> +=0A=
> +       return wmi_status_to_err(le16_to_cpu(*result_status));=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * amd_halo_wmi_turn_off - Turn off all LED channels=0A=
> + * @wdev: WMI device pointer=0A=
> + *=0A=
> + * Return: 0 on success, negative error code on failure=0A=
> + */=0A=
> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)=0A=
> +{=0A=
> +       struct amd_halo_wmi_args args =3D { };=0A=
> +=0A=
> +       return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, si=
zeof(args));=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * amd_halo_wmi_set_rgb - Set all RGB channels atomically=0A=
> + * @wdev: WMI device pointer=0A=
> + * @r: brightness for red channel (0 - 100)=0A=
> + * @g: brightness for green channel (0 - 100)=0A=
> + * @b: brightness for blue channel (0 - 100)=0A=
> + *=0A=
> + * Return: 0 on success, negative error code on failure=0A=
> + */=0A=
> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, u=
32 b)=0A=
> +{=0A=
> +       if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
> +           g > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
> +           b > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
> +               return -EINVAL;=0A=
> +       }=0A=
> +=0A=
> +       struct amd_halo_wmi_args_rgb args =3D {=0A=
> +               .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),=0A=
> +               .red =3D cpu_to_le32(r),=0A=
> +               .green =3D cpu_to_le32(g),=0A=
> +               .blue =3D cpu_to_le32(b),=0A=
> +       };=0A=
> +=0A=
> +       return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(=
args));=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * amd_halo_wmi_get_rgb - Get RGB values=0A=
> + * @wdev: WMI device pointer=0A=
> + * @r: output buffer for red value=0A=
> + * @g: output buffer for green value=0A=
> + * @b: output buffer for blue value=0A=
> + *=0A=
> + * Return: 0 on success, negative error code on failure=0A=
> + */=0A=
> +static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, u=
8 *b)=0A=
> +{=0A=
> +       struct amd_halo_wmi_args_rgb args =3D {=0A=
> +               .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_GET),=0A=
> +       };=0A=
> +       struct wmi_buffer input =3D {=0A=
> +               .length =3D sizeof(args),=0A=
> +               .data =3D &args,=0A=
> +       };=0A=
> +       struct wmi_buffer output =3D {};=0A=
> +       int ret;=0A=
> +=0A=
> +       ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,=0A=
> +                                  &input, &output, sizeof(struct amd_hal=
o_wmi_output_rgb));=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       struct amd_halo_wmi_output_rgb *data __free(kfree) =3D output.dat=
a;=0A=
> +=0A=
> +       ret =3D wmi_status_to_err(le16_to_cpu(data->status));=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
> +           data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
> +           data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
> +               return -EPROTO;=0A=
> +       }=0A=
> +=0A=
> +       *r =3D data->red;=0A=
> +       *g =3D data->green;=0A=
> +       *b =3D data->blue;=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * amd_halo_brightness_set - Set LED brightness and color=0A=
> + * @cdev: LED class device=0A=
> + * @brightness: Brightness value=0A=
> + *=0A=
> + * Return: 0 on success, negative error code on failure=0A=
> + */=0A=
> +static int amd_halo_brightness_set(struct led_classdev *cdev,=0A=
> +                                  enum led_brightness brightness)=0A=
> +{=0A=
> +       struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);=0A=
> +       struct amd_halo_led_data *data =3D container_of(mc_cdev,=0A=
> +                                                     struct amd_halo_led=
_data,=0A=
> +                                                     led_mc);=0A=
> +       u32 red_hw, green_hw, blue_hw;=0A=
> +       int ret;=0A=
> +=0A=
> +       guard(mutex)(&data->lock);=0A=
> +=0A=
> +       led_mc_calc_color_components(mc_cdev, brightness);=0A=
> +=0A=
> +       if (brightness =3D=3D 0)=0A=
> +               return amd_halo_wmi_turn_off(data->wdev);=0A=
> +=0A=
> +       red_hw =3D mc_cdev->subled_info[0].brightness;=0A=
> +       green_hw =3D mc_cdev->subled_info[1].brightness;=0A=
> +       blue_hw =3D mc_cdev->subled_info[2].brightness;=0A=
> +=0A=
> +       ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_h=
w);=0A=
> +       if (ret)=0A=
> +               goto out;=0A=
> +=0A=
> +       return 0;=0A=
> +=0A=
> +out:=0A=
> +       /*=0A=
> +        * Consider the light bar non-functional if AMD_HALO_WMI_RGB fail=
ed.=0A=
> +        * Attempt to turn the LED off completely as clean-up.=0A=
> +        */=0A=
> +       if (amd_halo_wmi_turn_off(data->wdev))=0A=
> +               dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LE=
D off on cleanup\n");=0A=
> +=0A=
> +       return ret;=0A=
> +}=0A=
> +=0A=
> +/**=0A=
> + * amd_halo_probe - Driver probe function=0A=
> + * @wdev: WMI device=0A=
> + * @context: Context data (unused)=0A=
> + *=0A=
> + * Return: 0 on success, negative error code on failure=0A=
> + */=0A=
> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)=
=0A=
> +{=0A=
> +       struct led_init_data led_init_data =3D {=0A=
> +               .devicename =3D "amd_halo",=0A=
> +               .default_label =3D "multicolor:" LED_FUNCTION_STATUS,=0A=
> +               .devname_mandatory =3D true,=0A=
> +       };=0A=
> +       struct amd_halo_led_data *data;=0A=
> +       u8 r, g, b;=0A=
> +       int ret;=0A=
> +=0A=
> +       data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);=0A=
> +       if (!data)=0A=
> +               return -ENOMEM;=0A=
> +=0A=
> +       ret =3D devm_mutex_init(&wdev->dev, &data->lock);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       data->wdev =3D wdev;=0A=
> +       dev_set_drvdata(&wdev->dev, data);=0A=
> +=0A=
> +       data->subled_info[0].color_index =3D LED_COLOR_ID_RED;=0A=
> +       data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;=0A=
> +       data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;=0A=
> +=0A=
> +       data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;=
=0A=
> +       data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNE=
SS;=0A=
> +       data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_bright=
ness_set;=0A=
> +       data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETA=
IN_AT_SHUTDOWN;=0A=
> +       data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);=0A=
> +       data->led_mc.subled_info =3D data->subled_info;=0A=
> +=0A=
> +       ret =3D amd_halo_wmi_get_rgb(wdev, &r, &g, &b);=0A=
> +       if (ret)=0A=
> +               return ret;=0A=
> +=0A=
> +       data->subled_info[0].intensity =3D r;=0A=
> +       data->subled_info[1].intensity =3D g;=0A=
> +       data->subled_info[2].intensity =3D b;=0A=
> +=0A=
> +       ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &da=
ta->led_mc,=0A=
> +                                                       &led_init_data);=
=0A=
> +       if (ret)=0A=
> +               return dev_err_probe(&wdev->dev, ret,=0A=
> +                                    "Failed to register multicolor LED\n=
");=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static const struct wmi_device_id amd_halo_id_table[] =3D {=0A=
> +       { .guid_string =3D AMD_HALO_GUID },=0A=
> +       { }=0A=
> +};=0A=
> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);=0A=
> +=0A=
> +static struct wmi_driver amd_halo_driver =3D {=0A=
> +       .driver =3D {=0A=
> +               .name =3D "amd_halo_led",=0A=
> +       },=0A=
> +       .id_table =3D amd_halo_id_table,=0A=
> +       .probe =3D amd_halo_probe,=0A=
> +       .no_singleton =3D true,=0A=
> +};=0A=
> +=0A=
> +module_wmi_driver(amd_halo_driver);=0A=
> +=0A=
> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");=0A=
> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");=0A=
> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");=0A=
> +MODULE_LICENSE("GPL");=0A=
> =0A=
> ---=0A=
> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d=0A=
> change-id: 20260429-halo-leds-v2-plus-722c8083afe8=0A=
> =0A=
> Best regards,=0A=
> --=0A=
> Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
> =0A=
> =
