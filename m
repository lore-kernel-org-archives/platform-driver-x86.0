Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010017.outbound.protection.outlook.com [52.103.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB110E3;
	Sun, 25 Jan 2026 20:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769372862; cv=fail; b=rIdryqsavbP9KFOiFd+8UmoOo/+5pHG25sytd00T45UVYMRcPlenL3vN2oG7aG4pemNAlTq2DvBokVnv03emm99kzzIaKv9NEduKtwibj+IBlWFSLQIveHqP+OWzONaLpy7jW+U6ocuDFziYzeIxyISi0FFT+ZeSTfYDTVU/Wdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769372862; c=relaxed/simple;
	bh=lodtI0SGgTbSWCqcuJOho6g/aLciRHArd98Va90SFNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oCzeDDxwmT5C2d+X6uSeR2CHJcMuYtJXlJWjpEq+s0gzc9h32VR47w2OqZ8AoVf2UKon4FbbvH6Fc3M6ng/CIwozfu1wGubNI1e/2EVLo3KyUDNXv8ujNEons/afSIeHaJFsPRbavYaKAwfu2+k1SR+x5cuXW1FKjWsScCM5LqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HHbaMQdQ; arc=fail smtp.client-ip=52.103.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HHbaMQdQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TulrrNpkse4FJLriTJeDTOnyzNYk0z4ek8AWeA0DZW5QU93NcQKBlpZAjmpsrO8eKzLiwXLcMYyAKoH1zeQWghtj7k9WiMCrBMH6cOtR4cUrFvIiMOh7C53FyS0Q/aE+fQE7qatqZo8lHxLRVYRrwkdMMyAro8ASmny92d9MaEb7+FPlyTT0jxTz+NKhF04FsS0dszIS5SB8D6m7GiB0NF8iynMdJJW1+QDn6DKsNXLa5+iS8gtWf2X3liQ6HNIKlNAZUxUrUoTRWPoX5DjCyxNZh40rHz67qRda4CviGMvYDpy0U9/a0PHfJBvTg2KxsGRXd8AIYgk4bTQmbqBGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIH21ToRyg5Cx9vYaHLBh6TOraIKO7l7iTyBdTMfOrY=;
 b=A5EaO9KRXooCZTKZ5VwxdR5eYxSZ2mvNuVc1UXphPYVEd6h5aK93Qj6fLOzsMLYpV9hS1mku8RoRjYrMrxivzqYsP9ep0vxKWji5TS2x4eG3X3BVjr9/bqwFCRzy2XNMRqRwpZz+MTtERhIj3PpA4noTK9UlQej5rH7u3SL7wXabqR1k7qI1oQfS51qgRldRxzJoBgS84fExHRYur3aWjx3ilc0CcGhMiaAdLRKMiC7660ufjDGZDaVdTqL9hfTTVMGkyBzs6pjpjMPlpcaJR+j2IYdwVAktiOGBSuW3F4IIYUBcFBuuDrDHYQlw3lRNdK4cZ9FuRu/g36qAE2/VyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIH21ToRyg5Cx9vYaHLBh6TOraIKO7l7iTyBdTMfOrY=;
 b=HHbaMQdQp8rfvLo113xqbzuUPALOc3d2oFXc8ElgS35TQY1on4VcWiH4yTtxn/QDoU3isn5bIpSwa+JbAahdYKaZX1pv1Coga3/ox1034glBn0c7j0PODP1M7xhReY5+T4yz8rFkuFTHzSzr3TCt+dCHiuZNFK9wIZRx7k7v6vWSqquH0bDuKILvUNpPg6CPIljLgPfj8/TdwiZgyb2w6XDPIZLx/dSKmCVqIQfnXpzVWMVhb2nZcqvgTZzGQZ9+9aEixRCScPHQYHhcAffdrl+QxPLFGlmQ0uCr7eysD7y6wOR2pqEKL6s+Zq/t9Ln/ThKpbU9dvwCVEYIYg9aOUg==
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com (2603:1096:400:b6::5)
 by TYYPR01MB15070.jpnprd01.prod.outlook.com (2603:1096:405:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Sun, 25 Jan
 2026 20:27:38 +0000
Received: from TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d]) by TYCPR01MB6851.jpnprd01.prod.outlook.com
 ([fe80::b4ac:4d8e:c794:940d%5]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 20:27:38 +0000
From: Jesse Guo <jesseguotech@outlook.com>
To: Hans de Goede <hansg@kernel.org>,
 Ilpo =?UTF-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 Gladyshev Ilya <foxido@foxido.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: redmi-wmi: Add more hotkey mappings
Date: Mon, 26 Jan 2026 04:27:30 +0800
Message-ID:
 <TYCPR01MB6851F2386BFB226052BB500DD192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
In-Reply-To: <9cb776b4-6fe3-453d-b895-28119ca14499@foxido.dev>
References:
 <TYCPR01MB685170EB124F5AAC3DF736C7D192A@TYCPR01MB6851.jpnprd01.prod.outlook.com>
 <9cb776b4-6fe3-453d-b895-28119ca14499@foxido.dev>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: BMXPR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::30) To TYCPR01MB6851.jpnprd01.prod.outlook.com
 (2603:1096:400:b6::5)
X-Microsoft-Original-Message-ID: <13417755.eNJFYEL58v@jesseguo>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB6851:EE_|TYYPR01MB15070:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a45f41-d087-4c01-0d85-08de5c502e8d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|15080799012|461199028|6090799003|8060799015|19110799012|51005399006|23021999003|3430499032|19061999003|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eEl1enZjUGxDbDhCdEtNVzBWaUMyMFRJRTJmVCtGZVdnSkZldFdGemgxZWhI?=
 =?utf-8?B?UUlCNEZJb3E2bEFIL2FNN1ZyMytncEdLSzJqa2FuM1ZCcGhzRktHTnRxK3lp?=
 =?utf-8?B?UHFhQ2d2M0JyTGNvb09tZVpRNDFJSExSN28rQXNicnhZdUFXRlNNam03RzZ6?=
 =?utf-8?B?UkxuT3BkNE9kbUJZLzdwY0IzWTdSRnJvQ2VmSzhQZHUwd1g0ZGdhdzNsRlRG?=
 =?utf-8?B?aExoc29DUHNueldFNmVlZ0NHSFNHUHBySkpYVmUrLzU1VzVoSnA5TUI5ZzdL?=
 =?utf-8?B?bDRaV2FEeDZxZ3hkalFZbnBtL3I1dTBLQmZxQTB6SlpGWnZucGsrK2tUa2tR?=
 =?utf-8?B?VzVmUGh1Q0NUUUY3WlNqWHZMWmplc3oybCtWL2lYUzN3QkVJSEptZEpPbHUy?=
 =?utf-8?B?VG9pZFhOWFBNWFQ5dEFJR09vVUlMS2dvUWxKN3J6NlZjL2gvKzBIRFJQL20x?=
 =?utf-8?B?M3pZWWZlNCtHOGZQV3l6SUJHYlFHZEs0Qm44MHdXa0syNnlDKytTTEs1clVp?=
 =?utf-8?B?bUhzLzBDTUNuc283cDR2TWdtcFhLc2tNOVFXUUl3V3Zpay9SRGVMZEdpZ3dG?=
 =?utf-8?B?YStSTGQyQTFMQ3lhcnJabE9rNFgvTXJLcnFCZ3dwS2tra3ZVbXhRT3dxQWlM?=
 =?utf-8?B?bEh5enN4ekhWeFprNEdEZUZUSTZPN1BpY0lDQjFUaUdjYVlaT0VwR1J4OUNX?=
 =?utf-8?B?Yit5TGVNRnB2NXUwa2tIRnB3RFY1NTlicXAwUGdLbWpVcjI5SHlDVmNyMm9y?=
 =?utf-8?B?d0NaTVVxNGxEYTg0cWFVV1M4UnN2cEFyK2VRZ1lQdDBoRXNvMWJ4TXZHTmM3?=
 =?utf-8?B?dFh0eU8veEp4QmhhVi9ZS0NLYlFyajJ4SDFYdlVBSzlpZTc5SHlqUUZtZjRM?=
 =?utf-8?B?ZUxQN2p2MTR2MGpiQnBucVpNaGo4MmJCVnUrcmtwd0RmM0JsNFBpc3VxUUd3?=
 =?utf-8?B?WGZLMlVuV3hOZk1TUWFNWnhiWXpNaFc0Sk1LR0RhMGpGNmg0elJxdTFsM0dQ?=
 =?utf-8?B?TnFCOWRpNklzTFE1SjBEK25XYTliTnlJRGcvcDREc2tHSEN1QnJxcldLL3Y5?=
 =?utf-8?B?cUN3ZWR4NFdhRVFwWFpaV1U1d0hVYW5aNUNoUkprdzg1K3g4cFhZL0N4K3dM?=
 =?utf-8?B?WjEzV1VUTldrcGd6VTlsZTZLTWhJckQzT204Sk5iRUdlSVgxM2xGZ1M0SXh4?=
 =?utf-8?B?ZFJTdVBSdE5wb0ZTM1hMQ3F4VVE0T2dBR1BiS3pvU085Q0VoZHM1M2J1NElI?=
 =?utf-8?B?THphaWo3dE8vM3pPWTRxa1ZXQU9lQUZ2bi83MkdETC9LOXV6M2o4cTJXRlhQ?=
 =?utf-8?B?VEhoR01TaWw2YWRlMkxwWGdMQzkvcUIxUEU3MzR2NFBUY1FzQ3ZGT096VWMw?=
 =?utf-8?B?c2lHZ0VIcGc1ZXlWaHJOT1VkMHN4cXpPdHVMN2NCZHBsT1gvMG9hK08zeExR?=
 =?utf-8?B?dUpGamJxS041UUh2TEQrQTdhS3JxZHRtWmxveUFIYWwyMkR0dW5qLzhqMURa?=
 =?utf-8?B?eC8rVFRRMCt6QmxIZ2hlZFkzMk9WOHBsdGQrbmdSWmlIVlA4amRuL0NvZmow?=
 =?utf-8?B?c0VWZk1lVENLWjgwdHV1azdKTXF5Y05wYTM0WGdmZ2hLS2NOSjl0NEM4aHpn?=
 =?utf-8?Q?Tgj7CdGoaX2NUyGhGfFViwxLAg2x4wqthYHRMetIXqjw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDBhUWJlaE1wL0t3OGlMY0tFMEYxclFORlZNelhMNlFneFlkeUNyMUpyV1o1?=
 =?utf-8?B?bmwwT095OFN6WHByZUtJdXdLbG5tVTNoSjhNMEhLajdBRTA3NTRTNzBhaStn?=
 =?utf-8?B?dVZMelZ1bWFIM1NWV09lMHJxKzM5MnA3akZYRWF5eit3eDIwWEJhOWVQNUly?=
 =?utf-8?B?MGZraG9RMW04TUUzRkFTSDdHZ2o1R3g4VFkxaXFsZWVjTDJyR1dKWWZTL2Jz?=
 =?utf-8?B?eTZIeFFhZldzLytmN0l5dVpDYXFHb1ZGZ1ZPVXlaZmNYQTR6bDArNXArakRV?=
 =?utf-8?B?YVUvNzA4MVNIaUl4Y2VXZ0hvZ21mNmNKSDRZZ0dRK1NMNDMvTm5ibVdQQUly?=
 =?utf-8?B?TEoybnQ5S3NjSVlya05GOXhwQlI4QmlPVTB4aDNDazcwQXV0YlJXdmx6Qytp?=
 =?utf-8?B?c2huQnBVZVJtbkVySndmWHBCRFFnSXZ5SnhZRjJHOEhDR1cwTUlmZ2dZeFJD?=
 =?utf-8?B?NDFudW5zMllhVytnVWhSTlh4Y0NFSTIxOGdFM3hINGVXMGtMcUIxcWVNYmdZ?=
 =?utf-8?B?ZmM0cmNZT2Noa1dUMDRORmErUVEvS3dUZ05aeDNTN1RPYmVRa2RaQkhwUzdJ?=
 =?utf-8?B?emNYM1hTWGROVWkzMERMM2h0cXFNZUNzQXdyaENzMkoxY2VBL2Z1c1J4ck10?=
 =?utf-8?B?QU1DZ0NlZnJDU0hScnFFUXk5K25RQlBFZGxVZDJMeU9tMGtKc0Q5R1BkQkpY?=
 =?utf-8?B?NXFCVW5xWXNwVm9ZVHZJYXZZSURiNzNRYnF6ZE1rbVhydnF6MUtpMVN3QW1U?=
 =?utf-8?B?QVpBU3lEeTA1UzM3MlRrWk1FRDNhaDVldWQyMUhRMUw5OE8zY3lFQ0pMQ0hp?=
 =?utf-8?B?U2dMRng5cTJhRjl4aER3SmNwMm1HUGlIZ3FNS2k4a29FWWF0RDI0VytvS0VG?=
 =?utf-8?B?ak9ZTFVJbDRnOW5xMGhMcTZVRDY4ZlF5dDdmVW90WkQwQnRrMUJ4WEFYd2dH?=
 =?utf-8?B?NzY4Q3VLak5KTmVWc3ZDNEo3UStSeGU5R21ROXJ4RG9LUzZyU3I4VHIwbWZ3?=
 =?utf-8?B?YXgyTVNEaS9JcC9wMGtzUHc2ektCN3NyUklKNndyK05NM3RVanBSckNUWkZ6?=
 =?utf-8?B?VTZWTmxobjRnVXZlcktGcXZkR1lOQkNVTTlWSWV4SzZQOVJ5ejF3cWZsdHpE?=
 =?utf-8?B?WFhWMVppRFErNXY5ODlOc0t3cGdsTVlyUHFXN2VEMHVGbCttalRQOVBoVG5r?=
 =?utf-8?B?S3ZNYThpdDlkeE82ZXdwd01BTk5meGZFVEtNU2UxU0NlL3Brd2VVbyszMmNE?=
 =?utf-8?B?TTU0UW0zNS9mT2x3anRreDlJYkk4Qlo3eU5xczNXZWhrMWF4TDJxbnphWHJW?=
 =?utf-8?B?U0NNRElrSy9zVXU4dTJRd0xoZ1h6Nk5SY3RzWVNKb0VRTEg4T2k5Q0NwU0JP?=
 =?utf-8?B?MUZsWmc5NWxWeHRxREhLTnJuZElzTnpXMllOcllFVHNKOSswWEhnazRNT2Qv?=
 =?utf-8?B?MmhteDhOVmxZamlDOG80VWw4a0o4NWdBbHBiQUhEanhNVEEzTlpYdW9DMkFm?=
 =?utf-8?B?YkhQcjV6dUJuYmJPM0VxNmlVZy9ScjBKUkE0YWZpb0xMZGQ1NzNHT3J5dTJi?=
 =?utf-8?B?QUQzbFJEakZhd0FQa1FGbFAyaWluM29TZnhDdjlzRWNYZlFqeG5RSGNhalRB?=
 =?utf-8?B?QmVDcjZ4dHB2SFpVck5KeFA4SkFqVmFZMGhjcnh1VFpoNzNOc0lXL3ZIQ0Uy?=
 =?utf-8?B?akFaY0QxK2gwR1h0VHNXYTdaSmszZ3dlaEFld3BoKzh1dHJuSjhNbm9UWG9K?=
 =?utf-8?B?YkZpeERIb1pDem9NeEF6VkQ3SEN1S1IrVS9rRkNpeU1MNmY3d1N3NDQ5Nm5t?=
 =?utf-8?B?Z1A3R3l5WG1lQ3dVNDB4UE51K1UwbEh0Qm1lakVwVUtNL2ZJaHVKZXk2Qml5?=
 =?utf-8?B?UHBNdFJRMmlWSmsyR0ZFMTlpOVZhQ0dVQU9JVURsdkU1NXM4VkRqemdmNEoy?=
 =?utf-8?Q?A8xAJHLCMwZIXQZKNkHQY1AtY2Mf1W+e?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a45f41-d087-4c01-0d85-08de5c502e8d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6851.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 20:27:38.2959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15070

On Sunday, 25 January 2026 22:59 UTC+8, Gladyshev Ilya wrote:
> On 1/25/26 16:42, Jesse Guo wrote:
> > This patch adds more Fn hotkeys (like Refresh rate toggle).
> > Additionally, remap the setup key from KEY_SETUP to KEY_CONFIG.
> > As KEY_CONFIG is supported by Desktop Environments for launching
> > system settings, whereas KEY_SETUP is often ignored by userspace.
> > 
> > Signed-off-by: Jesse Guo <JesseGuoTech@outlook.com>
> > ---
> >   drivers/platform/x86/redmi-wmi.c | 25 ++++++++++++++++++++++++-
> >   1 file changed, 24 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi-wmi.c
> > index 949236b93a321a943a9cb8b0528d730dbaa2cd6f..27e593aa64cac8a11e8fbace16ac76ca059180b3 100644
> > --- a/drivers/platform/x86/redmi-wmi.c
> > +++ b/drivers/platform/x86/redmi-wmi.c
> > @@ -20,7 +20,10 @@
> >   static const struct key_entry redmi_wmi_keymap[] = {
> >   	{KE_KEY, 0x00000201,	{KEY_SELECTIVE_SCREENSHOT}},
> >   	{KE_KEY, 0x00000301,	{KEY_ALL_APPLICATIONS}},
> > -	{KE_KEY, 0x00001b01,	{KEY_SETUP}},
> > +	{KE_KEY, 0x00001b01,	{KEY_CONFIG}},
> > +	{KE_KEY, 0x00011b01,	{KEY_CONFIG}},
> > +	{KE_KEY, 0x00010101,	{KEY_SWITCHVIDEOMODE}},
> > +	{KE_KEY, 0x00001a01,	{KEY_REFRESH_RATE_TOGGLE}},
> >   
> >   	/* AI button has code for each position */
> >   	{KE_KEY, 0x00011801,	{KEY_ASSISTANT}},
> > @@ -32,6 +35,26 @@ static const struct key_entry redmi_wmi_keymap[] = {
> >   	{KE_IGNORE, 0x00050501, {}},
> >   	{KE_IGNORE, 0x000a0501, {}},
> >   
> > +	/* Xiaomi G Command Center */
> > +	{KE_KEY, 0x00010a01,	{KEY_VENDOR}},
> > +
> > +	/* OEM preset power mode */
> > +	{KE_IGNORE, 0x00011601, {}},
> > +	{KE_IGNORE, 0x00021601, {}},
> > +	{KE_IGNORE, 0x00031601, {}},
> > +	{KE_IGNORE, 0x00041601, {}},
> > +
> > +	/* Fn Lock state */
> > +	{KE_KEY, 0x00000701, {KEY_FN_ESC}},
> > +	{KE_KEY, 0x00010701, {KEY_FN_ESC}},
> You probably want to extend KEY_ASSISTANT's exception in `notify` 
> callback to properly map pressed / unpressed state.
> 
I have tested this, and the behavior differs from the AI button.
The event is just a reflection of the mode change but not
pressed / unpressed state  (similar to the keyboard backlight toggle).
> Also, wouldn't mapping Fn Lock introduce inconvenience (e.g., a user 
> wouldn't expect a key event when just locking the Fn keys)?
> 
Agreed. Since the Fn Lock state is primarily internal to the EC.
Mapping it might introduce unexpected behavior or confusion.
Do nothing is better than break something.
> Otherwise, great addition
Will drop the Fn Lock mapping in v2.
> > +	/* Fn+`/1/2/3/4 */
> > +	{KE_KEY, 0x00011101, {KEY_F13}},
> > +	{KE_KEY, 0x00011201, {KEY_F14}},
> > +	{KE_KEY, 0x00011301, {KEY_F15}},
> > +	{KE_KEY, 0x00011401, {KEY_F16}},
> > +	{KE_KEY, 0x00011501, {KEY_F17}},
> > +
> >   	{KE_END}
> >   };
> >   
> > 
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20260125-redmi-wmi-hotkey-add-666af84b0eeb
> > 
> > Best regards,
> 




