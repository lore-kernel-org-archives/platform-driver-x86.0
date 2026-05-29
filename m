Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F330B3321A2;
	Fri, 29 May 2026 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780044671; cv=fail; b=PrhDZGqsw4nWLrzadrGKL/HdDHAlVjhFW7Dyx+4igsemJki2E/Y6uzZqj2lwGfbCfWYGaGIN2cVTTgG0QP9EZmncUCvsTktblvVi2ctGw7YpP2df2mRRF0XQdm1VgJUgFya1w2+32nXx0aueiLnXMBEgcSRek6adWT9FuQPxATk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780044671; c=relaxed/simple;
	bh=4dk30fhpBOkdn+gkG/mFL9eyUBZr3Rm6OYDNM8baDnk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NIp79y1up5PqQ60V+hsCCkuuVgMHASPpa+NZ/OiPeX6GhXUOLIG7naj8Xqxtg6LkWedl0/lWfBHCj8vqFb9S9VCYQQUr4fA3c/XGRFr1i/qoFZsbhP+RKpp4nlVjaj81WYCsRUmjf30LQPrpd9SDbCV8+bbYW1v28xEYby18Pv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VECaoXJR; arc=fail smtp.client-ip=52.101.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VECaoXJR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhhxgyUKBCW6ZkTQBs7BEW1ZsGl0wDkuJc7H9UZbG/sg+jvHnInk+jW3nmzitHd4CrFGyS3NVJTP6jkZ2H1gV6lyLYbaB1QoDye0+Oxlljpg7F9f97KBnXCBguWHUBBRIhMYQgOfuBFuaGM+FfvdWICi2ZRTGPWADRjXJioTi7XUpKNu1fMVnlxGKvtRaCM08XumZ1DDFUk0HPFyJd/k8PjYOQxAGB8UAlSH6MVvRk2aJ63s6vrEMDttQ0KxbOq3j5+scxXb04fgcI55Ik4/bcbfRE38w7FHhTZW1IDcqapTNIMCC7wt9E/rqzAVup7xF81EutO9AxMM+rWazaqOHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQQKtn80Dyh7pg/E+H13c8ctmgk2IAO6gs5PcdqGKbo=;
 b=JSSVNQ9j0AC0Kjz2FSltQfUpUiws+mQnIfXS7L76yABmjwlvAddUILMVXiTtzcdJxj+UycsW6lXM8dK4UGBg9TNkri829O6GhTtZ6ma1ZKdNJyRga3chWBPX2VbE9F/44+DPmjP3eEYy7Jkixib15TTTQEUD5++YL0wg5ZTIgIQmy1FuDYFK46xHi/ybVS2z9+A39VOccRCQKQLuCKbrQHpbtrEGTupeU27IoiHjQTOngXi43RjJc+lqTWhRQbhVE8YLqbAHhthKDzlXnQctzPYMi6m/UClrkYI/WYyp8qy6XTC6IXkkP7s9eRagSyP1EUOt3RhBL0u4S0bSp6rwXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQQKtn80Dyh7pg/E+H13c8ctmgk2IAO6gs5PcdqGKbo=;
 b=VECaoXJRnlOlf7Em9P5r1zKhxUdQIRJQBOFNJi9QOiR3ZgBtM8TV5iwiN4nQ5kpGPWVC9QGQZvZXpjNFMnd7h4wkpjPLbU1NVVGLw58iHmL2OsoenpZhg28/eDpOj83kEbABAUNv91kjVY5g2VW6ZVFzCr4oavwfXj2QeFizsp0=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by DS3PR12MB999242.namprd12.prod.outlook.com (2603:10b6:8:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Fri, 29 May
 2026 08:51:06 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0071.010; Fri, 29 May 2026
 08:51:06 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v5] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Topic: [PATCH v5] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Index: AQHc6sU3+XY8dEwezEaTwwq6Oc9perYjZbyAgAFS5Xo=
Date: Fri, 29 May 2026 08:51:06 +0000
Message-ID:
 <DS0PR12MB8479731E578E60688E074B32FE162@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20260523-halo-leds-v2-plus-v5-1-497dc9719a18@amd.com>
 <a1ed18f9-a658-4cc6-6c4c-46eb16d1c5ad@linux.intel.com>
In-Reply-To: <a1ed18f9-a658-4cc6-6c4c-46eb16d1c5ad@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-29T08:51:05.807Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|DS3PR12MB999242:EE_
x-ms-office365-filtering-correlation-id: 2c312727-1f2c-4d04-fc37-08debd5f6be7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|38070700021|6133799003|56012099006|11063799006|4143699003|5023799004|3023799007;
x-microsoft-antispam-message-info:
 c7OTUjUIBxKohgYIdgJnVfiutw2oUyJWmi8UyqaClh/6P9XIBjKAocGUtgwa1nxhbUTGcLBwcUYgRMXd2IhPMELq+blGCz6gobj97ADXEP5IHnqAoeP9amDXWNscEJRCFg/0btjguT4olg4jeWnlKi8RSqDJMz7MAS2R2O/yP7TAcu40tQFdGSZ9Ld6eBbO2HbgU2uFCbuHMw7EhBej53JHH3A6DoKQVt+7uEZG6Wy7VJU70yQe72Knud9GmVtcJNEpCVoq9xItW4kC4AHHBRoLs4HxVhQoDuiOLbS8PC9hYbnjTqlpeGYS7De/i2+x7kYUMft2WQFM7aoFG6aNimkU10h/ttieY9g7N7jh4kL7TXRrq8hQPmBcZBvCEK+O5+fkCQcK+9gRVR+y+JIJhkeCGemi7T457UwVBy1b9jEi8UUNvEn8YplEQhrg5A0l3kuo7AZr6VWU0RDbNU7V3nGnQu163M6VY9pjRL4fDc6pCYPMmP86xZw714iPnXpYMSv45wRm2w8VGznsb84aU2ecDEQ688/+JrBCnFSutRnKcK4GqHTAOr/Hre62x9AeBzaeM+p0u2r/NKdh40NdgpiYmxuL+Rmk7hOZoAog9uOMJgHMt18ZnTNSx83tu3wfIk1tdgblEviQb1Ne+/IMF6/uiJw8w/o+lWULP9ZCJywBF0g1ME1IKJCQ64CXb9r6vjrxd6ASZk2VcCnikD+v+EfSlBoMMS7LjwZXTX0SIjT817jLrguEa43CHtA9M5tLclGE5wetrSBxULn8dcRvZmw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(5023799004)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?aOL/iBOZnMoNoOEk0JWUQ+ECUlUDmwe8J5VokZbA3+pWLP45WQtuL3I8/D?=
 =?iso-8859-1?Q?7S79MPO6G/JBtqqPGNKGWOvcI3xnXl51rdos405Y78rjYvUl8KzHY9FjPK?=
 =?iso-8859-1?Q?4bu2L812IKFBrfqEenG4EW1jhUjTHewnKiniwyrnfKAq9z5nUvePds8J6a?=
 =?iso-8859-1?Q?zlMvmRQ4eJNw9BZgAjTDfWU3sA+1TFRzVMCbvAVRA5k7+DwzJSIe1NMLF3?=
 =?iso-8859-1?Q?U2KIY12DpENdi+plw5gNwNE7TyIn0XQ5rLwRGthhrz/SBtwsR92JraDLJ3?=
 =?iso-8859-1?Q?17VQPbX8ZEORiKNl3/G4l+EVonZy7LDREcdQI2f7ACjhlIlUFBbCFsTec0?=
 =?iso-8859-1?Q?arEiFkOmcggP2k/u/SK7nMcD0NKWTdC0NSsA6UdnNdlW/kcvCeGRQMZOYv?=
 =?iso-8859-1?Q?js0D3HnNLEKadZODnMefiYgVI27VigjfxHNvIE9BKhNgVSGI9+BMMarDb3?=
 =?iso-8859-1?Q?FOFDxcBLQr0RgMdmc2bnq3C+/z8Ed68hsY/vsYwh9nQ5cSEbsco+0hAs6Z?=
 =?iso-8859-1?Q?K5bSBb1wgSOnaeakKw7BiPnzJcOIngd3WPxZIKLuyoBGYO8G5lBjVOlFum?=
 =?iso-8859-1?Q?ECJa+4dS7C5gjwcOmqxSJ0K38NciOK5lNwQJqUCF1W3Fokz08Vxiqwz1n9?=
 =?iso-8859-1?Q?4aZ45Am5rDstg+06Hhr20FPOlIpKn9gryzpXtBfYoFqe+0WoG1tVvcwtiO?=
 =?iso-8859-1?Q?XLGTeIFUAHF1AIXWrZmolxZ634ok5ieqRqg0x/t60zDEt6SaYXQAqGFdV8?=
 =?iso-8859-1?Q?2exNmmbiVtvGALDXUcGKpmzuMDVXfQaltrGiXIZ7lNIyn652ONEoybwsrE?=
 =?iso-8859-1?Q?F5tHKDAl+I87WjcCTelF4SVrSTsYEc1UJ+lscXD5KJGmLuo9J9+ZeJCfhb?=
 =?iso-8859-1?Q?XLl280+2e8Cznd7WdzRXifeV+b2wLGTvRDXOwzIXbtD7KTX3Zd4USto+rX?=
 =?iso-8859-1?Q?H9VGixdbw4YpIcLrfKvchR0zU/G7AIH6Ggw2jV+Jmkd1TErUDv1M1X2fAv?=
 =?iso-8859-1?Q?q8m/aXfhwzaqo8lrYNg/l0v3EctULVyGk6Jf1kRNYFWrdOYrezz7wrg3W4?=
 =?iso-8859-1?Q?4+un/MPGVjDvUBKblwJcxGnZC1pOcQELHHmt7O576y42BaeEFjJh9X730u?=
 =?iso-8859-1?Q?zDnmuGl2YXuzoC53c/YJf870iuDuj6yvuYBsPlMvqw1qBKKnbSum4RFtng?=
 =?iso-8859-1?Q?CL11eaqyxSb295oyAbiGXZLXNtivd+GTkr9rwHQLYabXcAU/CHcbkH2x4S?=
 =?iso-8859-1?Q?hsUhFv8NpW3Fk/2R3ntM7JAFC5NJGdgDjIdnDfZ/Xiyk72rp29ZyimGzmv?=
 =?iso-8859-1?Q?j+OPCCFUbdRda+/MoLf8f4k/uMLwS8iOtSK8jb6fhZ2hja5L1rUPZMaOql?=
 =?iso-8859-1?Q?PhUNkeJR+Pi9g1ygYJFocKYYdVuZABocOlx7QY87jMdujQlpcJD9VR+V/I?=
 =?iso-8859-1?Q?bKYzLBZp6YjiiN+2SkBVeDy3tSGrVhb+R/Ivuk4Ozpwn+GZipjyblBbczz?=
 =?iso-8859-1?Q?RTpetao11X7WplJhtgNr5wCnipmUVXHsp0wJ98IZAMom/TkfAx0hgMErnX?=
 =?iso-8859-1?Q?GKw3PsQA7BEIshdfTFHywKlcTb1b9O0railTxKrB6yLZ+qu/L3WcWB5kG6?=
 =?iso-8859-1?Q?X6Oqw+7dg9RD6PpAkA5xTVPw/NlyepglBvxIcfRGc8IK2wX7ggQew7YwKr?=
 =?iso-8859-1?Q?sJ1SxQfDQZtH6qYdGmPTNeXEZtMgWqLJYsVcCdvylKM0z0SPVAHQxbsSwT?=
 =?iso-8859-1?Q?H9KMbeyjet/xn8PoYmSjuzdE2u62+QhhqvGMSYlJWobqj1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c312727-1f2c-4d04-fc37-08debd5f6be7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2026 08:51:06.2816
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuFbvthdhoa7oXQTt6bvOjfae3BHNaHXr6xfUivbVqteLqCrz8Pazc5x5aUI31sP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999242

>=0A=
>=0A=
>=0A=
>________________________________________=0A=
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=0A=
>Sent: Thursday, May 28, 2026 8:29 PM=0A=
>To: Lin, Leo=0A=
>Cc: Hans de Goede; Mario Limonciello (AMD); LKML; platform-driver-x86@vger=
.kernel.org; S-k, Shyam-sundar; Armin Wolf=0A=
>Subject: Re: [PATCH v5] platform/x86/amd: Introduce Halo Box RGB LED drive=
r=0A=
>=0A=
>On Sat, 23 May 2026, Yo-Jung Leo Lin (AMD) wrote:=0A=
>=0A=
>> The Halo Box features an RGB LED light bar that can be controlled=0A=
>> through WMI methods to display any color combination.=0A=
>>=0A=
>> The driver exposes the LED through the LED multicolor subsystem,=0A=
>> allowing userspace to control RGB values via sysfs:=0A=
>>   /sys/class/leds/amd_halo:multicolor:status/multi_intensity=0A=
>>   /sys/class/leds/amd_halo:multicolor:status/brightness=0A=
>>=0A=
>> Hardware interface:=0A=
>> - Three separate RGB channels (Red, Green, Blue)=0A=
>> - All 3 channels are configured at once with a single WMI method call=0A=
>> - Value range: 0-100 (matching hardware range directly)=0A=
>>=0A=
>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>=0A=
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>=0A=
>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>=0A=
>This seems mostly okay, there are a few minor things still to address=0A=
>marked below.=0A=
>=0A=
>> ---=0A=
>> v4 -> v5=0A=
>> No code chang. Only email etiquette fixes=0A=
>> - Fix the "From: " in the mail from leo.lin@amd.com to Leo.Lin@amd.com,=
=0A=
>>   so that it matches s-o-b=0A=
>> - Pull the Reviewed-by trailer from previous threads.=0A=
>> - Link to v4: https://lore.kernel.org/r/20260521-halo-leds-v2-plus-v4-1-=
b498bbab36a2@amd.com=0A=
>>=0A=
>> v3 -> v4=0A=
>> There's a new WMI method we introduced in BIOS for color setting, to=0A=
>> replace the original ones, so in this version:=0A=
>> - Introduce a new "AMD_HALO_WMI_RGB" method ID. This WMI method takes 1=
=0A=
>>   command argument (GET/SET) and 3 RGB values. This method is capable of=
=0A=
>>   turning on and setting all RGB channels at once in a single call, redu=
cing=0A=
>>   some undesirable visual effects when setting them separately.=0A=
>> - Replace color setting code with this new "AMD_HALO_WMI_RGB" method.=0A=
>> - Remove implementations of unused WMI methods.=0A=
>>=0A=
>> This version also fixes things pointed out in the previous version:=0A=
>> - Explicltly specify the endianess of WMI arguments as __le32, and use=
=0A=
>>   endian-conversion helpers accordingly.=0A=
>> - Use scope-based cleanup helper for WMI buffer.=0A=
>> - Remove cleanup for channel setting WMI in probe.=0A=
>> - Explicitly include headers for kfree and le16_to_cpu=0A=
>> - Fix white spaces=0A=
>> - Fix designated initializor style=0A=
>> - Link to v3: https://lore.kernel.org/r/20260508-halo-leds-v2-plus-v3-1-=
91df458966ea@amd.com=0A=
>>=0A=
>> (Didn't pull Shyam's Reviewed-by because this is a relatively bigger cha=
nge.)=0A=
>>=0A=
>> v2 -> v3:=0A=
>> - Re-introduce OF/OFF method: implement them with wmidev_invoke_method=
=0A=
>> - Explicitly call the ON method on brightness_set callback for=0A=
>>   brightness !=3D 0; call the OFF method when brightness =3D=3D 0=0A=
>> - Turn off light bar if TURN_ON/SET_LIGHTBAR can't function normally=0A=
>> - Replace get_unaligned_le64 with casting and le16_to_cpu()=0A=
>> - Add an inline function (wmi_status_to_err) to convert WMI return=0A=
>>   values to errno=0A=
>> - Use amd_halo_wmi_set_channel in probe to set default color=0A=
>> - Use devm_mutex_init() instead=0A=
>> - Remove unused includes=0A=
>> - Link to v2: https://lore.kernel.org/r/20260504-halo-leds-v2-plus-v2-1-=
af027727605b@amd.com=0A=
>>=0A=
>> v1 -> v2:=0A=
>> - Fix Kconfig dependencies=0A=
>> - Remove amd_halo_wmi_turn_off(). Handle the case where brightness=3D0 w=
ith the=0A=
>>   same logic where brightness !=3D 0=0A=
>> - Remove the brightness_get callback, because currently there isn't a=0A=
>>   well-defined global bightness in hardware. Note that the sysfs brightn=
ess=0A=
>>   stil works. It just caches the value last set.=0A=
>> - Convert to wmidev_invoke_method()=0A=
>> - Convert to ARRAY_SIZE()=0A=
>> - Convert some macros to enum=0A=
>> - Convert to devm_led_classdev_multicolor_register_ext()=0A=
>> - Rename sysfs path to amd_halo:multicolor:status=0A=
>> - Fold default LED colors setting in probe, before registration=0A=
>> - Add no_singleton option=0A=
>> - Make default RGB values into macros and adjust their values=0A=
>> ---=0A=
>>  MAINTAINERS                             |   7 +=0A=
>>  drivers/platform/x86/amd/Kconfig        |  11 ++=0A=
>>  drivers/platform/x86/amd/Makefile       |   1 +=0A=
>>  drivers/platform/x86/amd/amd_halo_led.c | 267 +++++++++++++++++++++++++=
+++++++=0A=
>>  4 files changed, 286 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index 8063cb56feef..cde3865addb4 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -1138,6 +1138,13 @@ F:     drivers/char/hw_random/geode-rng.c=0A=
>>  F:   drivers/crypto/geode*=0A=
>>  F:   drivers/video/fbdev/geode/=0A=
>>=0A=
>> +AMD HALO BOX RGB LED DRIVER=0A=
>> +M:   Mario Limonciello (AMD) <superm1@kernel.org>=0A=
>> +R:   Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>=0A=
>> +L:   platform-driver-x86@vger.kernel.org=0A=
>> +S:   Supported=0A=
>> +F:   drivers/platform/x86/amd/amd_halo_led.c=0A=
>> +=0A=
>>  AMD HSMP DRIVER=0A=
>>  M:   Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>=0A=
>>  R:   Carlos Bilbao <carlos.bilbao@kernel.org>=0A=
>> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd=
/Kconfig=0A=
>> index b813f9265368..a1a74ef6c859 100644=0A=
>> --- a/drivers/platform/x86/amd/Kconfig=0A=
>> +++ b/drivers/platform/x86/amd/Kconfig=0A=
>> @@ -34,6 +34,17 @@ config AMD_WBRF=0A=
>>         This mechanism will only be activated on platforms that advertis=
e a=0A=
>>         need for it.=0A=
>>=0A=
>> +config AMD_HALO_LED=0A=
>> +     tristate "AMD Halo Box RGB LED Driver"=0A=
>> +     depends on ACPI_WMI && LEDS_CLASS_MULTICOLOR=0A=
>> +     help=0A=
>> +       This driver provides RGB LED control for AMD Halo Box devices=0A=
>> +       through the LED multicolor subsystem. The Halo Box light bar can=
=0A=
>> +       be controlled via sysfs to display any RGB color combination.=0A=
>> +=0A=
>> +       To compile this driver as a module, choose M here: the module=0A=
>> +       will be called amd_halo_led.=0A=
>> +=0A=
>>  config AMD_ISP_PLATFORM=0A=
>>       tristate "AMD ISP4 platform driver"=0A=
>>       depends on I2C && X86_64 && ACPI=0A=
>> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/am=
d/Makefile=0A=
>> index f6ff0c837f34..2f467dbbfc8a 100644=0A=
>> --- a/drivers/platform/x86/amd/Makefile=0A=
>> +++ b/drivers/platform/x86/amd/Makefile=0A=
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_AMD_PMC)               +=3D pmc/=0A=
>>  obj-$(CONFIG_AMD_HSMP)               +=3D hsmp/=0A=
>>  obj-$(CONFIG_AMD_PMF)                +=3D pmf/=0A=
>>  obj-$(CONFIG_AMD_WBRF)               +=3D wbrf.o=0A=
>> +obj-$(CONFIG_AMD_HALO_LED)   +=3D amd_halo_led.o=0A=
>>  obj-$(CONFIG_AMD_ISP_PLATFORM)       +=3D amd_isp4.o=0A=
>>  obj-$(CONFIG_AMD_HFI)                +=3D hfi/=0A=
>> diff --git a/drivers/platform/x86/amd/amd_halo_led.c b/drivers/platform/=
x86/amd/amd_halo_led.c=0A=
>> new file mode 100644=0A=
>> index 000000000000..f9ee6368f8ea=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/platform/x86/amd/amd_halo_led.c=0A=
>> @@ -0,0 +1,267 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/*=0A=
>> + * AMD Halo Box RGB LED Driver=0A=
>> + *=0A=
>> + * Copyright (C) 2026 Advanced Micro Devices, Inc.=0A=
>> + *=0A=
>> + * This driver provides RGB LED control for AMD Halo Box devices throug=
h=0A=
>> + * the LED multicolor subsystem. The Halo Box light bar can be controll=
ed=0A=
>> + * via sysfs to display any RGB color combination.=0A=
>> + */=0A=
>> +=0A=
>> +#include <linux/led-class-multicolor.h>=0A=
>> +#include <linux/leds.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/mutex.h>=0A=
>> +#include <linux/wmi.h>=0A=
>> +#include <linux/byteorder/generic.h>=0A=
>> +#include <linux/slab.h>=0A=
>=0A=
>These must be in alphabetical order.=0A=
=0A=
Ok, will fix it.=0A=
=0A=
>=0A=
>Put the byteorder one into a separate group separated with a blank line.=
=0A=
>=0A=
>> +=0A=
>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"=0A=
>> +=0A=
>> +/* WMI method IDs from MOF */=0A=
>> +enum {=0A=
>> +     AMD_HALO_WMI_TURN_OFF =3D 0x04,=0A=
>> +     AMD_HALO_WMI_RGB =3D 0x07=0A=
>> +};=0A=
>> +=0A=
>> +/* Arg0 of the AMD_HALO_WMI_RGB Method */=0A=
>> +enum {=0A=
>> +     AMD_HALO_RGB_CMD_GET,=0A=
>> +     AMD_HALO_RGB_CMD_SET=0A=
>> +};=0A=
>> +=0A=
>> +/* Status codes from spec */=0A=
>> +#define AMD_HALO_STATUS_SUCCESS              0x0000=0A=
>> +#define AMD_HALO_STATUS_INVALID_PARAM        0xFFFD=0A=
>> +=0A=
>> +/* Brightness uses 0-100 range */=0A=
>> +#define AMD_HALO_MAX_HW_BRIGHTNESS   100=0A=
>> +=0A=
>> +/* Default RGB brightness */=0A=
>> +#define AMD_HALO_DEFAULT_RED         50=0A=
>> +#define AMD_HALO_DEFAULT_GREEN               30=0A=
>> +#define AMD_HALO_DEFAULT_BLUE                30=0A=
>> +=0A=
>> +/**=0A=
>> + * struct amd_halo_led_data - Driver private data=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @led_mc: LED multicolor class device=0A=
>> + * @subled_info: RGB channel information=0A=
>> + * @lock: Mutex to protect WMI calls=0A=
>> + */=0A=
>> +struct amd_halo_led_data {=0A=
>> +     struct wmi_device *wdev;=0A=
>> +     struct led_classdev_mc led_mc;=0A=
>> +     struct mc_subled subled_info[3];=0A=
>> +     struct mutex lock;      /* Protects WMI method calls */=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_args {=0A=
>> +     __le32 arg0;=0A=
>> +     __le32 arg1;=0A=
>=0A=
>Please add types.h=0A=
=0A=
Will add all the includes you mention here in the next version (and sort th=
em accordingly).=0A=
=0A=
>=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_args_rgb {=0A=
>> +     __le32 cmd;=0A=
>> +     __le32 red;=0A=
>> +     __le32 green;=0A=
>> +     __le32 blue;=0A=
>> +};=0A=
>> +=0A=
>> +static inline int wmi_status_to_err(u16 status)=0A=
>> +{=0A=
>> +     switch (status) {=0A=
>> +     case AMD_HALO_STATUS_SUCCESS:=0A=
>> +             return 0;=0A=
>> +     case AMD_HALO_STATUS_INVALID_PARAM:=0A=
>> +             return -EINVAL;=0A=
>> +     default:=0A=
>> +             return -EIO;=0A=
>> +     }=0A=
>> +}=0A=
>> +=0A=
>> +static int __amd_halo_wmi_call(struct wmi_device *wdev,=0A=
>> +                            u32 method_id, void *data, size_t length)=
=0A=
>> +{=0A=
>> +     struct wmi_buffer input =3D {=0A=
>> +             .length =3D length,=0A=
>> +             .data =3D data,=0A=
>> +     };=0A=
>> +     __le16 *result_status __free(kfree) =3D NULL;=0A=
>> +     struct wmi_buffer output =3D {};=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, method_id,=0A=
>> +                                &input, &output, sizeof(*result_status)=
);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) *=
/=0A=
>> +     result_status =3D output.data;=0A=
>=0A=
>Please move the variable declaration here (mid-function) as explained in=
=0A=
>the long comment in cleanup.h.=0A=
=0A=
Ok, will fix this.=0A=
=0A=
>=0A=
>> +     ret =3D wmi_status_to_err(le16_to_cpu(*result_status));=0A=
>> +=0A=
>> +     return ret;=0A=
>=0A=
>        return wmi_status_to_err(...);=0A=
>=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_turn_off - Turn off all LED channels=0A=
>> + * @wdev: WMI device pointer=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_turn_off(struct wmi_device *wdev)=0A=
>> +{=0A=
>> +     struct amd_halo_wmi_args args =3D { };=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_TURN_OFF, &args, siz=
eof(args));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_set_rgb - Set all RGB channels atomically=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @r: brightness for red channel (0 - 100)=0A=
>> + * @g: brightness for green channel (0 - 100)=0A=
>> + * @b: brightness for blue channel (0 - 100)=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_set_rgb(struct wmi_device *wdev, u32 r, u32 g, =
u32 b)=0A=
>> +{=0A=
>> +     if (r > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         g > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         b > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
>> +             return -EINVAL;=0A=
>> +     }=0A=
>> +=0A=
>> +     struct amd_halo_wmi_args_rgb args =3D {=0A=
>> +             .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_SET),=0A=
>> +             .red =3D cpu_to_le32(r),=0A=
>> +             .green =3D cpu_to_le32(g),=0A=
>> +             .blue =3D cpu_to_le32(b)=0A=
>=0A=
>Add the trailing comma.=0A=
=0A=
Ok, will fix this (and all the other details you mentioned).=0A=
=0A=
Thanks for your review!=0A=
=0A=
BR,=0A=
Leo=0A=
=0A=
>=0A=
>> +     };=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(a=
rgs));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_brightness_set - Set LED brightness and color=0A=
>> + * @cdev: LED class device=0A=
>> + * @brightness: Brightness value=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_brightness_set(struct led_classdev *cdev,=0A=
>> +                                enum led_brightness brightness)=0A=
>> +{=0A=
>> +     struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);=0A=
>> +     struct amd_halo_led_data *data =3D container_of(mc_cdev,=0A=
>=0A=
>Add container_of.h=0A=
>=0A=
>> +                                                   struct amd_halo_led_=
data,=0A=
>> +                                                   led_mc);=0A=
>> +     u32 red_hw, green_hw, blue_hw;=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     guard(mutex)(&data->lock);=0A=
>> +=0A=
>> +     led_mc_calc_color_components(mc_cdev, brightness);=0A=
>> +=0A=
>> +     if (brightness =3D=3D 0)=0A=
>> +             return amd_halo_wmi_turn_off(data->wdev);=0A=
>> +=0A=
>> +     red_hw =3D mc_cdev->subled_info[0].brightness;=0A=
>> +     green_hw =3D mc_cdev->subled_info[1].brightness;=0A=
>> +     blue_hw =3D mc_cdev->subled_info[2].brightness;=0A=
>> +=0A=
>> +     ret =3D amd_halo_wmi_set_rgb(data->wdev, red_hw, green_hw, blue_hw=
);=0A=
>> +     if (ret)=0A=
>> +             goto out;=0A=
>> +=0A=
>> +     return 0;=0A=
>> +=0A=
>> +out:=0A=
>> +     /*=0A=
>> +      * Consider the light bar non-functional if AMD_HALO_WMI_RGB faile=
d.=0A=
>> +      * Attempt to turn the LED off completely as clean-up.=0A=
>> +      */=0A=
>> +     if (amd_halo_wmi_turn_off(data->wdev))=0A=
>> +             dev_warn_ratelimited(&data->wdev->dev, "Failed to turn LED=
 off on cleanup\n");=0A=
>=0A=
>Please add include for this.=0A=
>=0A=
>> +=0A=
>> +     return ret;=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_probe - Driver probe function=0A=
>> + * @wdev: WMI device=0A=
>> + * @context: Context data (unused)=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_probe(struct wmi_device *wdev, const void *context)=
=0A=
>> +{=0A=
>> +     struct led_init_data led_init_data =3D {=0A=
>> +             .devicename =3D "amd_halo",=0A=
>> +             .default_label =3D "multicolor:" LED_FUNCTION_STATUS,=0A=
>> +             .devname_mandatory =3D true,=0A=
>> +     };=0A=
>> +     struct amd_halo_led_data *data;=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);=0A=
>> +     if (!data)=0A=
>> +             return -ENOMEM;=0A=
>> +=0A=
>> +     ret =3D devm_mutex_init(&wdev->dev, &data->lock);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     data->wdev =3D wdev;=0A=
>> +     dev_set_drvdata(&wdev->dev, data);=0A=
>> +=0A=
>> +     data->subled_info[0].color_index =3D LED_COLOR_ID_RED;=0A=
>> +     data->subled_info[1].color_index =3D LED_COLOR_ID_GREEN;=0A=
>> +     data->subled_info[2].color_index =3D LED_COLOR_ID_BLUE;=0A=
>> +     data->subled_info[0].intensity =3D AMD_HALO_DEFAULT_RED;=0A=
>> +     data->subled_info[1].intensity =3D AMD_HALO_DEFAULT_GREEN;=0A=
>> +     data->subled_info[2].intensity =3D AMD_HALO_DEFAULT_BLUE;=0A=
>> +=0A=
>> +     data->led_mc.led_cdev.brightness =3D AMD_HALO_MAX_HW_BRIGHTNESS;=
=0A=
>> +     data->led_mc.led_cdev.max_brightness =3D AMD_HALO_MAX_HW_BRIGHTNES=
S;=0A=
>> +     data->led_mc.led_cdev.brightness_set_blocking =3D amd_halo_brightn=
ess_set;=0A=
>> +     data->led_mc.led_cdev.flags =3D LED_CORE_SUSPENDRESUME | LED_RETAI=
N_AT_SHUTDOWN;=0A=
>> +     data->led_mc.num_colors =3D ARRAY_SIZE(data->subled_info);=0A=
>=0A=
>Add include.=0A=
>=0A=
>> +     data->led_mc.subled_info =3D data->subled_info;=0A=
>> +=0A=
>> +     ret =3D amd_halo_wmi_set_rgb(wdev, AMD_HALO_DEFAULT_RED, AMD_HALO_=
DEFAULT_GREEN,=0A=
>> +                                AMD_HALO_DEFAULT_BLUE);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     ret =3D devm_led_classdev_multicolor_register_ext(&wdev->dev, &dat=
a->led_mc,=0A=
>> +                                                     &led_init_data);=
=0A=
>> +     if (ret)=0A=
>> +             return dev_err_probe(&wdev->dev, ret,=0A=
>> +                                  "Failed to register multicolor LED\n"=
);=0A=
>> +     return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static const struct wmi_device_id amd_halo_id_table[] =3D {=0A=
>> +     { .guid_string =3D AMD_HALO_GUID },=0A=
>> +     { }=0A=
>> +};=0A=
>> +MODULE_DEVICE_TABLE(wmi, amd_halo_id_table);=0A=
>> +=0A=
>> +static struct wmi_driver amd_halo_driver =3D {=0A=
>> +     .driver =3D {=0A=
>> +             .name =3D "amd_halo_led",=0A=
>> +     },=0A=
>> +     .id_table =3D amd_halo_id_table,=0A=
>> +     .probe =3D amd_halo_probe,=0A=
>> +     .no_singleton =3D true,=0A=
>> +};=0A=
>> +=0A=
>> +module_wmi_driver(amd_halo_driver);=0A=
>> +=0A=
>> +MODULE_AUTHOR("Mario Limonciello (AMD) <superm1@kernel.org>");=0A=
>> +MODULE_AUTHOR("Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>");=0A=
>> +MODULE_DESCRIPTION("AMD Halo Box RGB LED Control Driver");=0A=
>> +MODULE_LICENSE("GPL");=0A=
>>=0A=
>> ---=0A=
>> base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0=0A=
>> change-id: 20260429-halo-leds-v2-plus-722c8083afe8=0A=
>>=0A=
>> Best regards,=0A=
>>=0A=
>=0A=
>--=0A=
> i.=0A=
>=0A=
>=
