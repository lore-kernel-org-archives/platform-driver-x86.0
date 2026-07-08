Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012070.outbound.protection.outlook.com [40.107.209.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA98404BDD;
	Wed,  8 Jul 2026 08:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500624; cv=fail; b=XrMmndRgMAwDe2Us0UqXcMGK6hLTqDQPv87QPt9pXEYjp3WmTEntBF5EpLGQXbpKdSJ+yGIA6ZdQYU1/y/zUe3KQAyW2of7EPbnSfYUZgOkZ/kY7ZRMCByyVKdph2c6/LxX1NMFtbFgMZov4GRwUa3c11/MZ6n1jHzMHqDYVnc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500624; c=relaxed/simple;
	bh=ZgWQbcvPKo1DLOK5MebvsIX0DRmTcU1u4bSTfid6WMQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L7itQ6qx8GqmQofDTuLu7MCxLSMtycqqW9BpL2gH74o5Gi1qAFIQE16V33/rq12dFlfoiE4uAmSq5MxmLz76jh3lUAonhbSE7aqUeuQOcpv+4Bc1BHYNdXynywZ6EWh5jLZ4mKa1W+y4P5POop0K5WaZF2vuELKEHaWjD/zCNnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s4peBXHS; arc=fail smtp.client-ip=40.107.209.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s4peBXHS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwfAxvdLgO0JpPvj4fRDH++7nkY1cGzmuJM62XuT3aVCKTyNH7IH/G6LA1rpvYKJbll+oVRhdxbhQGVkvUSJYMEsubh/UsNYU6X+yvVA6vZEMjvfXGoyUN4R2fA7yaXj2gws6by/r8Kspsp2+sMscnP4nYa3I2yZcvj1siPu/H3wCVWOok5QF1ay/+nqye3tK3kf9stguiA3Q3IzxVtkRB4qZRWj7VmPywFqET4XZ4V9ggdSDNYXQcZ62TJQbGSinWZylPsUrHddS5znYfP2tFALBSJms2NugfDdf3btJtRI34NyMwnMGBgiqBgh6VnZ45kKxwmOHLA1qBma73WAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/BuHy4yIHoKlZmDIXZBQ8HNeclspQOeIbUjvLrtBxo=;
 b=c9N6Bp2MXQELkHSYzRY0nX7p8+6SFJUaHt1rtVkVbB1CHlRHYZTf5OVJL9dlNuzFNImwOUutyIGn6kYIjGaRYycgeM5zk5PRlXgeSQ3xsdxX+CpcU93G4oR3vpNHbtTJi1QoaaXD1La+IzELpOyqix1iq4IdgoEgW1ouPT9cdevBKMuKOtq7qRwm5ZJkf8Tu3r585bYHj5ItzwHnn50fiHR0g9XQr4tcgFVaZSkXccIG6c7irY7niQ5iPJ73BZQlBAm1BuAir1W2MEiYcJUJqdoluQMb2QK7yR39vErAfjTqgpqYMST6y+XV6jlaPzrx5K66hCpSumxUKBhqwFRAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/BuHy4yIHoKlZmDIXZBQ8HNeclspQOeIbUjvLrtBxo=;
 b=s4peBXHSrzdCgL9K3+yrobejhmC4oSf39gNsMM3RbhAG79iYTaVRbcn3Jn0Q8pHyRM4HT1npME5FCfXVR9qTFo2hAT0FiU3mLvdQvU3CNJFDKRcSnrhZZqlMvMva7c8VsYs4HNP/uKORRWhFra/xYI6lm3PACFPpTsoZUep15s4=
Received: from DS0PR12MB8479.namprd12.prod.outlook.com (2603:10b6:8:155::19)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 08:50:17 +0000
Received: from DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78]) by DS0PR12MB8479.namprd12.prod.outlook.com
 ([fe80::efff:2f4b:eff3:bd78%6]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 08:50:14 +0000
From: "Lin, Leo" <Leo.Lin@amd.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hansg@kernel.org>, "Mario Limonciello (AMD)"
	<superm1@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Topic: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED driver
Thread-Index: AQHc+XyiNDa9Kmyi/ka1j3CoAJIIEbZiNgYAgAE+4sY=
Date: Wed, 8 Jul 2026 08:50:14 +0000
Message-ID:
 <DS0PR12MB847928EF5948299A9BB13382FEFF2@DS0PR12MB8479.namprd12.prod.outlook.com>
References: <20260611-halo-leds-v2-plus-v7-1-8aad73fccb6b@amd.com>
 <46f2d7c7-cdd8-b033-98c4-e44dbfcdb5fb@linux.intel.com>
In-Reply-To: <46f2d7c7-cdd8-b033-98c4-e44dbfcdb5fb@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-08T08:50:13.635Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=1;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB8479:EE_|MN0PR12MB6104:EE_
x-ms-office365-filtering-correlation-id: 79171918-9fdd-4ad6-ccd4-08dedccded58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|5023799004|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 3KBd4qn93Kp3uYf6XzlKgWZ+rDqYcmt5WpCAypeGjAdKYDNCBTyBdrX2AWjs6rtwTVBdBFkajjPgcV/PqiMfywx0WHhLcG6hgOIgyqvlntf1qMFLMNJonfSy1bN5DM6zfEmztE0gZ1NvimiJrxwDqBziEiS4Ag4yN1EV7YdyXycThylpdFZm4QGltdON25cmOG4qCZ3S3rHIgZFBlRSGvF3rXzOeCOVNzGh/NX5uydjyNqq3Lsl1E6A6AFm7ik+XkCyeyb5/5UNg1A/UnVg69oV7secbFbhKQlxL3m8vBV5wkSzgDkodbvDO7Z0bwdNpjNfVFnON0KwVkpZzZaBqPKN8bsQ3qcNPTQ2UVqaQfOPOKqi8R6iIwsAtf6G3VnBezm1TItWaJIHoUtrg5JBsHVqsXoRB9yiDC7eYtlI8a0uuG7xLTfYzyw9wYDel92LA/OMlFyv6tw5jbKI1Zc9QC6tRjmgDmd7ZTz1Wsbvsc5dvYkYZo4u00bN8hd1TKRQRoZs6LJIWXmnBHR125vxG31FAWgJGGZkWzYS2hP6SxIDQXCw+czuGQzsNJIPcAHJ5hRGoGClozT17YHy/qw3oFZCtl5fmERhH9gQCGuW3etHaRyJV3Rdp4ccyohFeXGW+jdjvq/JLqmWGLYIRrMKtSoxlpa6Mi37NuwlChxsdH5qCNS9gUlKgyQ52kcYgRai/AmuVDwfz3nT/3rWJC5SQNQ5djNM9CReRlq1l60VazZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8479.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(5023799004)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?M91V2cUHfAY8D4VXZezcDw0P2ziRrgnr5raeCo8dYzSGcQoGEgP2+kEjT8?=
 =?iso-8859-1?Q?y8Qc9R1T+9Y3jSRt9LAn0b4TYmZKt0BrL3ep5HjsvkrtDWwz0JSVt0jiti?=
 =?iso-8859-1?Q?65RKILGWwdJJ2QFf6zMpKHorqI6dE0Im9gLfaBqMV2nJXjEDgkYfzUuCi5?=
 =?iso-8859-1?Q?BW0B5ZJvaOY8gAzR+0nymNj0oKZZ4t91Ao51lFrRgPmz4EaTliTAKAicd4?=
 =?iso-8859-1?Q?lw6yMQ+xPFE8e7LUA2Mak5fwPBz5uMpmTnKbmmy53L8MLsSpRa2ltqN76S?=
 =?iso-8859-1?Q?eCvDJFgRhXsoMGXepBzp9lxKDbbxrXxEd/sDiIFopPgOdZzoAnKJOOHfz7?=
 =?iso-8859-1?Q?Bw4CO7nhBIBCb67UU3KigEInZh7OzCjV0RLQNj0Kg8r3U5uISpKJOMbEjp?=
 =?iso-8859-1?Q?u/Qge/hm4IUbEZtjzBnm8jC+4mvdmUP99PPtdlf7Yf9iUgx5n6AiO+rXor?=
 =?iso-8859-1?Q?qpQTgUWAMgOMD+pXFLgs/ZVhtKKhE48kr8/2C0PCYrYpLGdMBBJ1ykTD3d?=
 =?iso-8859-1?Q?UxbTrZS2fWRFRb7NkFaka8dqmZZrjd6VCqSepDY8t8YyOscLjzGwL73WvE?=
 =?iso-8859-1?Q?YDMdwZ/t5OeK0nxN+awfsThmaVG0V95YZ3C9nlNVWgN00I6L1NBI96Flsd?=
 =?iso-8859-1?Q?elrjhPirMwkikQJW/BxbMf7AYSHEv5MUWMJNmHgwOri1V8WBeb8kzqSj7t?=
 =?iso-8859-1?Q?M9hhfDZCD196iH/Vn0Qa3wBBh6N8qRcbiO+M65BE09CSmgVoGBYcNPaKr1?=
 =?iso-8859-1?Q?KiEEoIfRuq5BGOJZA4NgAjkl138D+gNmPU6p31SJPs7UpDQHD9CRuQ71fn?=
 =?iso-8859-1?Q?6DD9smopPLcAB0DLI3tE5/tTfcdOhbQuybqwudcmRDtbAmJqGz/4HBTphP?=
 =?iso-8859-1?Q?nLjXpNNYtodeia71BdQ75cc+U/jGyMUEqK+de1vjs2i6iUNIxIWtfLXfWx?=
 =?iso-8859-1?Q?gPwUo+uAp/rU13aYt38xfr2XiuWAmasy6OihgItm4NUc0rWMhmToRD6jtA?=
 =?iso-8859-1?Q?ELG12Y+9o6YzGUoAzYZw4BlK5j3MTcE1hvWvjzRicgUr13zERIoNuYFYxa?=
 =?iso-8859-1?Q?u0dIt/BVXM6hp4/z6PUmFiC2f3odgsi/E6obnPGHdM+DRxBnqUOh2d1FkS?=
 =?iso-8859-1?Q?LroPoWofqKZYq49uTwwqBy+1Jw6mBW86/it3uRgiVz9kBQVYXoTJnSXXPp?=
 =?iso-8859-1?Q?brD8fSOwjGlNP7ehBT887jkbGtogwi4Zzd98GCqLimKyV76m9EwJMM6/TT?=
 =?iso-8859-1?Q?06RF7TzcUXqKn4szjDyTFl2yWvXTigj3Q6BF2X6N2D6s3s+g7D1ehmXIor?=
 =?iso-8859-1?Q?oa4CNhUdJkiMqzqIRAKGlj5yv2zca6ZCVTxpvgL5QsnF6fELIPXc5IdBHQ?=
 =?iso-8859-1?Q?iB4tWr0PS8L/PGgQpm0Am/2fKsMYi1QaAJPwl8IQUohWsQ5ZzhvyCe3w7n?=
 =?iso-8859-1?Q?BOBZW8BQGBXFFRmZN2dK3BWDIVUTXixGYiF/RgDol/cS2f51sMWxJD9XYL?=
 =?iso-8859-1?Q?rFKfwnMh50am6ZAW3r+5SbViDqB+/oRQVyWfS4CwlOQ7Pz6JZJyskEsUzY?=
 =?iso-8859-1?Q?TVAPGg3mlncTbEhCAWmI/KLhtRv+n/QgkQFn3wzCxQt2MaCbuZPv0t8B9J?=
 =?iso-8859-1?Q?4T05RBB587juJ2jNf/MJaH9IJnGvIVG2/3DI+EteRzhSdaDA7iq8P5wQ85?=
 =?iso-8859-1?Q?ttkYXY0mnJyUfx16baJycwP47PIuVZGfqMtCgFkN8vWxgPY89Ih4iu9kHq?=
 =?iso-8859-1?Q?SojKZwAvy8Q64cedn0PdoyFVi5owUj8pGeRsck5nBD56LZ?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79171918-9fdd-4ad6-ccd4-08dedccded58
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 08:50:14.1499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad7IjJQDnnCJqQeXlBb5XGcqFdnzBu0S3qFNBOU93J9qA/W5e7pWHuurbSkyn7dY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104

>=0A=
>=0A=
>=0A=
>________________________________________=0A=
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>=0A=
>Sent: Tuesday, July 7, 2026 9:28 PM=0A=
>To: Lin, Leo=0A=
>Cc: Hans de Goede; Mario Limonciello (AMD); LKML; platform-driver-x86@vger=
.kernel.org; S-k, Shyam-sundar; Armin Wolf=0A=
>Subject: Re: [PATCH v7] platform/x86/amd: Introduce Halo Box RGB LED drive=
r=0A=
>=0A=
>On Thu, 11 Jun 2026, Yo-Jung Leo Lin (AMD) wrote:=0A=
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
>> ---=0A=
>> Send this patch revision because we now have better BIOS behavior which=
=0A=
>> allows us to remove of some hard-coded logic in the driver.=0A=
>>=0A=
>> There used be a BIOS behavior where WMI values don't correctly reflect=
=0A=
>> LED colors after S5. Setting known default values to LEDs on probe is=0A=
>> a compromise for that.=0A=
>>=0A=
>> That has been fixed in our new BIOS, so we no longer need to hard-code=
=0A=
>> the default colors in the driver.=0A=
>>=0A=
>> v6 -> v7=0A=
>> - Introduce a amd_halo_wmi_get_rgb() to get WMI values of colors, and=0A=
>>   read them on probe.=0A=
>> - Remove hard-coded RGB values.=0A=
>> - Link to v6: https://lore.kernel.org/r/20260529-halo-leds-v2-plus-v6-1-=
b7bf7b904a16@amd.com=0A=
>>=0A=
>> v5 -> v6=0A=
>> - Add missing includes and sort/group them accordingly=0A=
>> - In __amd_halo_wmi_call, remove some unnecessary intermedaite variable =
assignments=0A=
>> - In __amd_halo_wmi_call, move declaration of pointer managed by scope-b=
ased cleanup=0A=
>>   helpers closer to where it is used=0A=
>> - Add trailing comma to designated initializers=0A=
>> - Link to v5: https://lore.kernel.org/r/20260523-halo-leds-v2-plus-v5-1-=
497dc9719a18@amd.com=0A=
>>=0A=
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
>>  drivers/platform/x86/amd/amd_halo_led.c | 322 +++++++++++++++++++++++++=
+++++++=0A=
>>  4 files changed, 341 insertions(+)=0A=
>>=0A=
>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>> index b539be153f6a..6450962b003e 100644=0A=
>> --- a/MAINTAINERS=0A=
>> +++ b/MAINTAINERS=0A=
>> @@ -1130,6 +1130,13 @@ F:     drivers/char/hw_random/geode-rng.c=0A=
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
>> index 000000000000..824d3f7d680b=0A=
>> --- /dev/null=0A=
>> +++ b/drivers/platform/x86/amd/amd_halo_led.c=0A=
>> @@ -0,0 +1,322 @@=0A=
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
>> +#include <linux/array_size.h>=0A=
>> +#include <linux/cleanup.h>=0A=
>> +#include <linux/compiler_attributes.h>=0A=
>> +#include <linux/container_of.h>=0A=
>> +#include <linux/dev_printk.h>=0A=
>> +#include <linux/device.h>=0A=
>> +#include <linux/device/devres.h>=0A=
>> +#include <linux/led-class-multicolor.h>=0A=
>> +#include <linux/leds.h>=0A=
>> +#include <linux/module.h>=0A=
>> +#include <linux/mutex.h>=0A=
>> +#include <linux/slab.h>=0A=
>> +#include <linux/types.h>=0A=
>> +#include <linux/wmi.h>=0A=
>> +=0A=
>> +#include <linux/byteorder/generic.h>=0A=
>> +=0A=
>> +#define AMD_HALO_GUID "081E747B-E028-4232-AF24-EAAEAB2B1E86"=0A=
>> +=0A=
>> +/* WMI method IDs from MOF */=0A=
>> +enum {=0A=
>> +     AMD_HALO_WMI_TURN_OFF =3D 0x04,=0A=
>> +     AMD_HALO_WMI_RGB =3D 0x07=0A=
=0A=
Hi Ilpo,=0A=
=0A=
>=0A=
>Please align values.=0A=
>=0A=
>Please add comma to any non-terminating entry.=0A=
=0A=
Thanks for your time and review. Will fix this.=0A=
=0A=
>=0A=
>> +};=0A=
>> +=0A=
>> +/* Arg0 of the AMD_HALO_WMI_RGB Method */=0A=
>> +enum {=0A=
>> +     AMD_HALO_RGB_CMD_GET,=0A=
>> +     AMD_HALO_RGB_CMD_SET=0A=
>=0A=
>Ditto.=0A=
=0A=
Will fix this as well.=0A=
=0A=
>=0A=
>> +};=0A=
>> +=0A=
>> +/* Status codes from spec */=0A=
>> +#define AMD_HALO_STATUS_SUCCESS              0x0000=0A=
>> +#define AMD_HALO_STATUS_INVALID_PARAM        0xFFFD=0A=
>> +=0A=
>> +/* Brightness uses 0-100 range */=0A=
>> +#define AMD_HALO_MAX_HW_BRIGHTNESS   100=0A=
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
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_args_rgb {=0A=
>> +     __le32 cmd;=0A=
>> +     __le32 red;=0A=
>> +     __le32 green;=0A=
>> +     __le32 blue;=0A=
>> +};=0A=
>> +=0A=
>> +struct amd_halo_wmi_output_rgb {=0A=
>> +     __le16 status;=0A=
>> +     u8 red;=0A=
>> +     u8 green;=0A=
>> +     u8 blue;=0A=
>> +} __packed;=0A=
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
>> +     struct wmi_buffer output =3D {};=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     /* Return buffer per spec: Bytes[0:1] =3D Status (little-endian) *=
/=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, method_id,=0A=
>> +                                &input, &output, sizeof(__le16));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     __le16 *result_status __free(kfree) =3D output.data;=0A=
>> +=0A=
>> +     return wmi_status_to_err(le16_to_cpu(*result_status));=0A=
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
>> +             .blue =3D cpu_to_le32(b),=0A=
>> +     };=0A=
>=0A=
>It is not allowed to declare local variables mid-block (with the=0A=
>cleanup.h related variables being the sole exception due to the reasons=0A=
>explained in cleanup.h).=0A=
=0A=
Will move this to the beginning of the function. Thanks!=0A=
=0A=
BR,=0A=
Leo=0A=
=0A=
>=0A=
>> +=0A=
>> +     return __amd_halo_wmi_call(wdev, AMD_HALO_WMI_RGB, &args, sizeof(a=
rgs));=0A=
>> +}=0A=
>> +=0A=
>> +/**=0A=
>> + * amd_halo_wmi_get_rgb - Get RGB values=0A=
>> + * @wdev: WMI device pointer=0A=
>> + * @r: output buffer for red value=0A=
>> + * @g: output buffer for green value=0A=
>> + * @b: output buffer for blue value=0A=
>> + *=0A=
>> + * Return: 0 on success, negative error code on failure=0A=
>> + */=0A=
>> +static int amd_halo_wmi_get_rgb(struct wmi_device *wdev, u8 *r, u8 *g, =
u8 *b)=0A=
>> +{=0A=
>> +     struct amd_halo_wmi_args_rgb args =3D {=0A=
>> +             .cmd =3D cpu_to_le32(AMD_HALO_RGB_CMD_GET),=0A=
>> +     };=0A=
>> +     struct wmi_buffer input =3D {=0A=
>> +             .length =3D sizeof(args),=0A=
>> +             .data =3D &args,=0A=
>> +     };=0A=
>> +     struct wmi_buffer output =3D {};=0A=
>> +     int ret;=0A=
>> +=0A=
>> +     ret =3D wmidev_invoke_method(wdev, 0, AMD_HALO_WMI_RGB,=0A=
>> +                                &input, &output, sizeof(struct amd_halo=
_wmi_output_rgb));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     struct amd_halo_wmi_output_rgb *data __free(kfree) =3D output.data=
;=0A=
>> +=0A=
>> +     ret =3D wmi_status_to_err(le16_to_cpu(data->status));=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     if (data->red > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         data->green > AMD_HALO_MAX_HW_BRIGHTNESS ||=0A=
>> +         data->blue > AMD_HALO_MAX_HW_BRIGHTNESS) {=0A=
>> +             return -EPROTO;=0A=
>> +     }=0A=
>> +=0A=
>> +     *r =3D data->red;=0A=
>> +     *g =3D data->green;=0A=
>> +     *b =3D data->blue;=0A=
>> +=0A=
>> +     return 0;=0A=
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
>> +     u8 r, g, b;=0A=
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
>> +     data->led_mc.subled_info =3D data->subled_info;=0A=
>> +=0A=
>> +     ret =3D amd_halo_wmi_get_rgb(wdev, &r, &g, &b);=0A=
>> +     if (ret)=0A=
>> +             return ret;=0A=
>> +=0A=
>> +     data->subled_info[0].intensity =3D r;=0A=
>> +     data->subled_info[1].intensity =3D g;=0A=
>> +     data->subled_info[2].intensity =3D b;=0A=
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
>> base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d=0A=
>> change-id: 20260429-halo-leds-v2-plus-722c8083afe8=0A=
>>=0A=
>> Best regards,=0A=
>>=0A=
>=0A=
>--=0A=
> i.=0A=
>=0A=
>=
