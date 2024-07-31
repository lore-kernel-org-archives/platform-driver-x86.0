Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2125.outbound.protection.outlook.com [40.107.105.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB941AE86E
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jul 2024 11:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722426884; cv=fail; b=WonRsm7itZ61kvXwk81vqm2/3O1elKkVgnsLNzOOeaiGtysbX76Lilyc74XBv4IQx+093gUydu9RpHe7cbBa6eUEPnUELtxGTBIG8h4HHUrlXtAXxqfBlVnJ+NY/PjqaVnJrLbt9ZiZKBeiHRmpXROifPKPvSIw61xLq9D9shrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722426884; c=relaxed/simple;
	bh=mCMJECTeMAWFaYJ1cpkyze0mzefP38UazoMcm160MQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o+ZkTpDn7dTC/yD9TVKwgecuW7KPtGkzO2W788KjuL0firBmDn8C9hhQO45TK1F7nsC8JUPsznCL5in9SjnRboQRkYuDucXgcoqHnWjbJZpkv7pYbEB8GwtxkT0xmZiIqkH3ZzWgEzO1ZhHESdJAYevVxTyst4FKXT+g7D06lh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=supcom.tn; spf=pass smtp.mailfrom=supcom.tn; dkim=pass (1024-bit key) header.d=supcom.onmicrosoft.com header.i=@supcom.onmicrosoft.com header.b=bryvTkoq; arc=fail smtp.client-ip=40.107.105.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=supcom.tn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=supcom.tn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=supcom.onmicrosoft.com header.i=@supcom.onmicrosoft.com header.b="bryvTkoq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEuRd21bES5nYhYl86E/sQ2JdoT15UD29nkvSWcdHA9qlxR1DOkEtZ30CPQrzLXI3knYIwk9CjMD/FyYMI4MT8IQuV3tieqsDmjV59SppWrWWo8Br+j14QIydYzhGSFBpXsmBp1b48g0bcQwfqEX7b/fqr0fnuzYNRkyjbLGswonJh3jLkQ7z9g8BTkAVvoo7+AN1CnSCJVeZakYNln0HeY6TbcOpktqo7Dtg8xue4cszZ49GLFq6oiLlwl34kDCRSh/mCutm6h91BYBuj+uCdilPitwKhniBUy2dygZgk2BkX811A9TjuiipbyP2bwPelmxo14aOPLGrY4Z/hfoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCG7rim1j5eOMQURLKeyi1u679TUP0ucpzHEtKsbsYU=;
 b=wjnZeL+jGd6zoRYv72b6gDn2FTzdDqLj5QpQkwLLrh8R43Pu2rJfkLal6t0Q/TXg/kClS/Wk5P5SE3/If8/eGEQhIK/fiQ+dR7Qo/Eq+jSI5x4g4EdhMhExgVmA/0jTFEwhwrIBtoUxg6fqNXlTiGlYXSAC3iMwp/c9QjId0AIijWOhC//gXIAc2nDMKkQVtk5n7fYMRgiqqukcOJEcyUsERk2s0BvyF3+hZ8uBqjGoyqAlpeIJhGbfWCG/BrW3arDCO6zP82NvvN4G1dL7E9uh1oAX7bfit8xB4XHQ4AvTIvXm42xoADaKXl52sQIGKP9mNebzgzzty8RgQ3LKHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=supcom.tn; dmarc=pass action=none header.from=supcom.tn;
 dkim=pass header.d=supcom.tn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=supcom.onmicrosoft.com; s=selector2-supcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCG7rim1j5eOMQURLKeyi1u679TUP0ucpzHEtKsbsYU=;
 b=bryvTkoqxZPY53Q7gu2szC8n3CvdxMRIJXN77tDtHsq7PbDDgZgYhT1GX5PTJQESD0WwPfAYhx+z6EeJY/ROQDIgDnKm6/eUlCgJ4TVkOF7i2ruSMtPswW+r+B9NLpWWndSQc0DJKlaxhLywWG/Hc5sQFm5dvOtyEABTuc8SFJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=supcom.tn;
Received: from AM8PR04MB7908.eurprd04.prod.outlook.com (2603:10a6:20b:24c::18)
 by AS5PR04MB9729.eurprd04.prod.outlook.com (2603:10a6:20b:650::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 11:54:35 +0000
Received: from AM8PR04MB7908.eurprd04.prod.outlook.com
 ([fe80::eb8c:cdd5:a0a:757f]) by AM8PR04MB7908.eurprd04.prod.outlook.com
 ([fe80::eb8c:cdd5:a0a:757f%5]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 11:54:35 +0000
Date: Wed, 31 Jul 2024 12:54:33 +0100
From: Mohamed Ghanmi <mohamed.ghanmi@supcom.tn>
To: Joshua Leivenzon <hacker1024@users.sourceforge.net>
Cc: platform-driver-x86@vger.kernel.org,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: Add lite thermal policy
 support
Message-ID: <Zqoln_jQlfP5yzS6@meddabeast>
References: <20240731113507.178929-1-hacker1024@users.sourceforge.net>
 <ME3P282MB300372C60091A735770D94B1A4B12@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME3P282MB300372C60091A735770D94B1A4B12@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
X-ClientProxiedBy: MR2P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::23) To AM8PR04MB7908.eurprd04.prod.outlook.com
 (2603:10a6:20b:24c::18)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7908:EE_|AS5PR04MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d520aa-a99b-4489-c33a-08dcb1578c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|41320700013|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nm/GpUOvqqnTwZ7qcsUUy1CYtsTapywOBtt2j+1fqiEdIK6HIduKjw9HvAk/?=
 =?us-ascii?Q?SuzoENdiwIYjB4rzhZrpgg76U8y5mL0pZETQGtbYcqqMx3RvByxdfe9tZnJ8?=
 =?us-ascii?Q?NiTJtESZVWLmlAW9XmWgYXVrMzx1pVNA1I2J6bMrTTwbG/IVAyFaJ5Sfy8zP?=
 =?us-ascii?Q?NvRiudsb8I+LmTiRdBItrzgTMRgHDWlZJxfAMer5bMlgjlv50E77+yz7sFSi?=
 =?us-ascii?Q?c7eeDMfbWxP9nPpq/lQ0Uz4oOaKGBWTJSExJXq7PDB0eYz+2M7MQCy2+xQZr?=
 =?us-ascii?Q?p6Tpe5ErKWUPRwP00Z/mFEJPjB1NF/eA9+3Ps89ZIzKEIoe/XXPZJ5vSc2a/?=
 =?us-ascii?Q?ksT3uWyTK1vRyEAXlNUEy4YGHy1Hvh4lK0OPdERP1oIlSZpuguoV5b9yZw96?=
 =?us-ascii?Q?yxKNOT8nWiqPtftqFOdHiN82RZGjlgphGT986H8ayLL2fb/P8aMQzi1NJPtK?=
 =?us-ascii?Q?hCyjhZJJcFxsrT6YVC/pUjOYO/7GX6X8kVdFHtKN463BhWTuX/lNJBFB2uBV?=
 =?us-ascii?Q?24WeymbZyfAZFgPSZGVywtaTY0+3+dRPdQPW4f2b7dyCW6VEQmVHavfD81S8?=
 =?us-ascii?Q?uSaO1Hr+qzCBI+yy+4zKHPyn6C/gUSJTj+Mb2HosrVyFIQzIq2U1bWQBepao?=
 =?us-ascii?Q?0xYD5BtxngSVFmsI33KFaAfP+wSCTgd305ZQVcdaCMuP5Y8yAdazEZu10cdd?=
 =?us-ascii?Q?4+qP+eM/ptT915IwhFKMtTjK8W4s3xj6uPiC+0SwMiqrsdVnkebIchQQfW68?=
 =?us-ascii?Q?oo05MpHxo7zj56h7R8rykn8Io0SeWTemqJ4ktpxkQ2zFvsxRWkLx0ZCpxnyc?=
 =?us-ascii?Q?bJCTWYkKgCt2rD6H7r5Ni/3Gl7j2e1N5vNLuzQlKu8ntC9uioBVLbJXFB+gq?=
 =?us-ascii?Q?aT2cTcCww5ohrQAd7WqVIZIrROAOIN2R/VHHJPtxILpaXb2w7YOBi9Caq7ej?=
 =?us-ascii?Q?8ftfYNJUEEWadnQBnV3647x82AfWwIqkOzuwtedmPeoQTIqHFIQovB5NluKS?=
 =?us-ascii?Q?JSSGI2BeSveTDLrWCPhW53BExyhMW24n9DjFO6L1u0lB1pmcnGZZ2VUMNgXV?=
 =?us-ascii?Q?K0QgVTTJPU5j5QyYpDErCXeXLEqHIwbZlgnp8CQtBFqcXa+5aN1kojzsG6D8?=
 =?us-ascii?Q?44hJN6zV1ocmVHD/Vycua4jxQrdynYbSPqYtQH4sH2lb1i7GKmQWnTuvg8lu?=
 =?us-ascii?Q?ETlnphyzGc98+QjLQlth+nQaapIbYlFgmcZDoLgKixhVdpySajjtK+vEQkXT?=
 =?us-ascii?Q?CIRlhBwyDp8jA2ZOt+RHQkH+GiOIGOb3nUB77Xngrt5k6/mkn4Hzp6j/SxyT?=
 =?us-ascii?Q?A7IJzPzLFKRZi1TbzgA+SwoSjaIh4utyCQ2V+sAZ6JnT85Ig2CKJk8Uw2+ug?=
 =?us-ascii?Q?kqLz+48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7908.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(41320700013)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3oj3c1blHD3jHz1EK8P28yVl6GVttSzXZVeje14UseA/tcFYSOBldjuB8zig?=
 =?us-ascii?Q?hKezELlM2I3pa2hM9w9ELpPEqVrRX78Z6zm7Jd/WVtnsavYSOhVbJK3Ch1p4?=
 =?us-ascii?Q?GuY1Uvtr7kFm2TD5HxGYu4KgjXnuN7+otXZbsgJIh6yUPbiZspdFuqRRtm5a?=
 =?us-ascii?Q?4i4khiMW6tSemu+JZVLtuVsHQd00N6AH7b4onMBX1vbC94GalTmGpF3v8rs0?=
 =?us-ascii?Q?bKNqCrqGIyJJ55E9t/HXsoWJ25UjgEoIeen1aKx6zsHxH4KDJlORfEz+3tKe?=
 =?us-ascii?Q?p/F6iF9C79ZOdRRYAlU/NIjU8Nk0zUgEFd5vhNschhft2GrxSOxF2tG/GOuj?=
 =?us-ascii?Q?sSCh6BYvn5bKXilJ1zN1K7TaDKaUyWWUWloz2jJpgop1HhskEOfn8W14GFRn?=
 =?us-ascii?Q?v5nKZUGkTN/uSEwjEJ7CQOwgXZrwchOFE9oMbkokyYbKDxPtrn5+WxVmCx5t?=
 =?us-ascii?Q?AvY1PvL3Kx4Yo5fPl+NWhCcHfKp+nPdYME5FopRFrftG8kFG9mDi8JAfGwZc?=
 =?us-ascii?Q?+HOXCoCVhFPB2RwVxAlkUtdt3HkEwO0UXyRqjDxNFH92Msvg5fGBh0QiOyBF?=
 =?us-ascii?Q?6CwJ2JxsjUjWmTK8E5fib+Jix8XxzjYmMISZWznLjQ+yao7G3P2Uk0wHnIht?=
 =?us-ascii?Q?sRhhk+lBF5HEAzSKT4wSIN41NKj1YIsjwTS13sPJ8VEntd+Wbo3mfalJXGOK?=
 =?us-ascii?Q?L1VD/cNrLrt1A64MKV60pE7xWSWY0jivsX7UVMgGMXmj/G2rY6ZYKM+7tnQ+?=
 =?us-ascii?Q?5UKUkpdHxrKPlewiVlHALyK/BK9e9z7e+CAsxdDpXdGLUOZNcPSUyZaSQD0p?=
 =?us-ascii?Q?78WHl65oU/TbCOINafmHyvNj5dYQZqbijRWoZ3WuGjR4fq0WIpFfcZ3ehMGm?=
 =?us-ascii?Q?YSoz3cybNHrJDEEkHlqpAxYcUqfEx89rHqbvfhDNrAqUGgEhK5fr+4HdHrUa?=
 =?us-ascii?Q?xaPpHtXwCURO2oRvcljiXfwKwbJ5DOSPJvEIXTsCsCZsK+nr5J+UCwuKYw9o?=
 =?us-ascii?Q?9VKImFzsCuWJ0JoO2FkTCjO0fXD9Vv/aFJcQyRhm8dhnksk+UN21OY4cx26i?=
 =?us-ascii?Q?5JSsbf5dsdH27tW3JDNDlv6snFIzXmKb96sNc5fH7EdpfT7y4pgjN8+rz5+r?=
 =?us-ascii?Q?bPdoa6V0g/uxOf5PGY3AExS/pNlSNPa3i/ghlnH8LmVhPxLmPJV8I+xF3kyS?=
 =?us-ascii?Q?LqVO3TpoQr7u1HYcMGq4IEAzcqwfqQEtZaKESxg35vlyLoQxkcJP59SUaU4N?=
 =?us-ascii?Q?4gmIIKMx4h8DzPXIz1F3bl7LVlFQIStGmPtjed7ZM7+OyBe4zIH/y7HIiRHI?=
 =?us-ascii?Q?o5OpGm+YX6faNCy9s2LFbkXxqbkB5Awx/fqOGzFYtmBW1Yc/vB6R10nj3byJ?=
 =?us-ascii?Q?03sJ1a+us9jQAP9JzpGkjUAxxrQ8iq45fiJDF7dIJy6ChozjCGeA3woVw42T?=
 =?us-ascii?Q?k8DBi4oET7Qief8FMrgaQ7C9ZiyWnt3BNCNlbn5hoayiXblvARqmZ+x8Cy0J?=
 =?us-ascii?Q?BXbXNncf+Qdfmt9jAcvriq8t1PkX+i0TRmM1ix8aryPPBA0NfsiSR6cvM2wQ?=
 =?us-ascii?Q?AM25KUDo0nYuZ/XwpBfWGrwui1b7TFL11oIyGnVi?=
X-OriginatorOrg: supcom.tn
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d520aa-a99b-4489-c33a-08dcb1578c0d
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7908.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:54:35.1985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8f85f528-6195-4e97-8e41-f5a9ad3bed4a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ox0awGmLiBgvfHdEC9ltBD8wYg2EMPPJeA3jmvHGWvy4rkeIsnzKjUvVttPBqBJxCMtnCBLXJaFxpOBLW4GPUBb6vepjxcdBf1K6GrJGtrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9729

Hi, 

On Wed, Jul 31, 2024 at 09:35:07PM +1000, Joshua Leivenzon wrote:
> Some ASUS laptops, such as the Zenbook Duo 2024 (UX8406), use a different WMI
> device ID to set the thermal policy.
> 
> These devices tend to lack support for custom fan curve management, hence the
> "lite" designation.
> 
> Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
> ---
>  drivers/platform/x86/asus-wmi.c            | 102 +++++++++++++++------
>  include/linux/platform_data/x86/asus-wmi.h |   1 +
>  2 files changed, 76 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc735931f97b..a89cbc063a3f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -93,9 +93,13 @@ module_param(fnlock_default, bool, 0444);
>  #define ASUS_FAN_BOOST_MODE_SILENT_MASK		0x02
>  #define ASUS_FAN_BOOST_MODES_MASK		0x03
>  
> +#define ASUS_THROTTLE_THERMAL_POLICY_COUNT 3
>  #define ASUS_THROTTLE_THERMAL_POLICY_DEFAULT	0
>  #define ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST	1
>  #define ASUS_THROTTLE_THERMAL_POLICY_SILENT	2
> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT 0
> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST 2
> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT 1
>  
>  #define USB_INTEL_XUSB2PR		0xD0
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
> @@ -287,6 +291,7 @@ struct asus_wmi {
>  	bool kbd_rgb_state_available;
>  
>  	bool throttle_thermal_policy_available;
> +	bool throttle_thermal_policy_lite;
>  	u8 throttle_thermal_policy_mode;
>  
>  	bool cpu_fan_curve_available;
> @@ -3639,6 +3644,14 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
>  	err = asus_wmi_get_devstate(asus,
>  				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>  				    &result);
> +	if (err == -ENODEV) {
> +		err = asus_wmi_get_devstate(asus,
> +						ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE,
> +						&result);
> +		asus->throttle_thermal_policy_lite = true;
> +	} else {
> +		asus->throttle_thermal_policy_lite = false;
> +	}
>  	if (err) {
>  		if (err == -ENODEV)
>  			return 0;
> @@ -3659,7 +3672,10 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  
>  	value = asus->throttle_thermal_policy_mode;
>  
> -	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
> +	err = asus_wmi_set_devstate(
> +					asus->throttle_thermal_policy_lite
> +						? ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE
> +						: ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>  				    value, &retval);
>  
>  	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
> @@ -3701,7 +3717,7 @@ static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
>  	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
>  	int err;
>  
> -	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
> +	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
>  		new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>  
>  	asus->throttle_thermal_policy_mode = new_mode;
> @@ -3740,7 +3756,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
>  	if (result < 0)
>  		return result;
>  
> -	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
> +	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
>  		return -EINVAL;
>  
>  	asus->throttle_thermal_policy_mode = new_mode;
> @@ -3771,18 +3787,34 @@ static int asus_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>  
>  	tp = asus->throttle_thermal_policy_mode;
>  
> -	switch (tp) {
> -	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
> -		*profile = PLATFORM_PROFILE_BALANCED;
> -		break;
> -	case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
> -		*profile = PLATFORM_PROFILE_PERFORMANCE;
> -		break;
> -	case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
> -		*profile = PLATFORM_PROFILE_QUIET;
> -		break;
> -	default:
> -		return -EINVAL;
> +	if (!asus->throttle_thermal_policy_lite) {
> +		switch (tp) {
> +		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
> +			*profile = PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
> +			*profile = PLATFORM_PROFILE_QUIET;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		switch (tp) {
> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT:
> +			*profile = PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST:
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT:
> +			*profile = PLATFORM_PROFILE_QUIET;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
>  	}
>  
>  	return 0;
> @@ -3796,18 +3828,34 @@ static int asus_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  
>  	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
>  
> -	switch (profile) {
> -	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
> -		break;
> -	case PLATFORM_PROFILE_BALANCED:
> -		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
> -		break;
> -	case PLATFORM_PROFILE_QUIET:
> -		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
> -		break;
> -	default:
> -		return -EOPNOTSUPP;
> +	if (!asus->throttle_thermal_policy_lite) {
> +		switch (profile) {
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
> +			break;
> +		case PLATFORM_PROFILE_QUIET:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	} else {
> +		switch (profile) {
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST;
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT;
> +			break;
> +		case PLATFORM_PROFILE_QUIET:
> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
>  	}
>  
>  	asus->throttle_thermal_policy_mode = tp;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 0aeeae1c1943..f37e34ea36a5 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -68,6 +68,7 @@
>  #define ASUS_WMI_DEVID_SCREENPAD_LIGHT	0x00050032
>  #define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
>  #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY 0x00120075
> +#define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE 0x00110019

A patch already exists that fixes this issue but still not upstream
It adds support for modern vivobook laptops and some newer zenbooks
and uses platform profiles

https://lore.kernel.org/platform-driver-x86/20240609144849.2532-2-mohamed.ghanmi@supcom.tn/

>  
>  /* Misc */
>  #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
> -- 
> 2.45.2
> 
