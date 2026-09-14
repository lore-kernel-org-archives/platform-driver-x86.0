Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E277643F08F
	for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402163; cv=fail; b=fJ68FK0zOMe0muFtFc+HxBpMLnXaLv8KtP/psSzsaBoS79mW+zoe2UZzh6OhB8uzn6/11cK09ocSAf2vP68ylhOUtoN0DXvdZrI6aUkTjS26Q1dsm9Z43iTBuz8t91mJvxTWN4YuKvQWO/EeMqM8iyId83y9bq3Z5Z5yiHtJ+8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402163; c=relaxed/simple;
	bh=ogjZjlB3Z4MfxPkeaMK+nVduHkbX3bn1CllPO71vFy8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SBANyh0/s/j3mlunN7WqPmWiNhIKzIr47a6RQM3cFs5UaPiyJJAyb0lMbCOSzC6zpbvl1JspjfJEbor07X7t4arnyBmycJzlK0uQayl3XrZX8laWf2JhEbUAthOxiJ1gcaga9nYUgDE9U9NxxV/Q4jBOZ7T5pNQyZvoODh2Ateo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5PcK2Iq; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5PcK2Iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789402163; x=1820938163;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ogjZjlB3Z4MfxPkeaMK+nVduHkbX3bn1CllPO71vFy8=;
  b=W5PcK2Iqj2JJsyYpcBtwNDxObhuxjfbqpmxgFGTfy4aNyC2NGCHMFVUt
   mC8GuYxqD0oBwHuzAJTiZgS7Qxv1sRFWbs02Tp/WS4JToUmn8r3uVSqdX
   /rx/ba8PnRLQiTLu7tC/XyKRL9rmP1dgbqZUTwlJyx1p3RDWYXevmmS9e
   5FIhLQgtgm1gHJ5rGxeGTqIj71vM2fd+jom8ZxwWQCyLLsxuEt4bt1+eb
   wI554I3pPwJFOrtRqMNH4xamDmLmYS1aCWImmUrZ+k31Ns9b/z6OsbUZr
   R6KlNoqOCbg/adrDLQspeXEeFVbSoidEpa8pwx5dADXcxViXsbuLaUmC/
   g==;
X-CSE-ConnectionGUID: 9o1AuBYTS8GRtr0hMYRrNQ==
X-CSE-MsgGUID: 8WfqGPLBSfyzkWZkT6s7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107129498"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107129498"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:09:22 -0700
X-CSE-ConnectionGUID: kb5/0sHbQM+N08/Uws1zRQ==
X-CSE-MsgGUID: iwhySKBxTh2lrQg/tKb/jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296174707"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 09:09:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:09:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 09:09:20 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 09:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoO2wlTLh3FWsXz/MYmvtXa3G4lvThZru7G6IDXbc5u0roDUMXVhiGrksiJcT9VGJVGlFxngTussvPK2rcjWNXz3n8i7GnQ3XsVaVI0lWhiSUybfko4UOnZucWX2K7mkTf76aPgXAe3TFKvFXKt2XfpaPi+aiJ8oFaZhXBW93cgKv3U/+IzFPN3hyoyvGc+2SAnCs3DtQYtic3Oh9unyDbZVmQeIE2Kla1ahnSL7dQX5BpkpciL5xbGfwoEEDP4QYdpxibuBkPalgMQikHcesVNpvJKatMdxeO8NBGZlvYmC89Rfucu1zOMpNfeVVz6t8IC7E6mBLNSYLIDaMeOB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnx2btQDVwhlY0UZUbMgtpXbF9yBqfsHclPTnDh7tPk=;
 b=WbSIzcFT57VHFN90dgdmkV1plKahEGZptnmqyBXH1A7oIKHQDPBuz+TDlFy8Rtp9/PR5RttHc9AFa0aZB0ayJiolqdiffU5RzZeIwde1ns9pPdsQEuhLERuZ02y3dFFpQTNoGE6gQ8dG+kvdhzRSsVT6lM6mFIrFbXN3QbX6n0+YyG34Bf2sqOEBX03O2iVycYbSNXdSinrmmyCaKfJ2ClGtgdntXAh2movLShVtNrJhoir5XSl+wQNlAFdVyxZnC/qahAnc28z4yRuS4opTaPaY5o839+jZhWLR1EIoe8RFYDC+K5jOJ9nohZPXLnSoLAe63TlGEUcwsjFvrPUWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:09:16 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:09:16 +0000
Date: Mon, 14 Sep 2026 12:09:10 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>,
	<airlied@gmail.com>, <simona@ffwll.ch>, <david.e.box@linux.intel.com>,
	<anoop.c.vijay@intel.com>, <badal.nilawar@intel.com>,
	<matthew.d.roper@intel.com>, <james.ausmus@intel.com>,
	<karthik.poosa@intel.com>
Subject: Re: [PATCH v8 09/20] drm/xe/vsec: Add DOC text for VSEC
Message-ID: <aqgcJlZmfN6eiFaq@intel.com>
References: <20260911201148.1610547-22-michael.j.ruhl@intel.com>
 <20260911201148.1610547-31-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260911201148.1610547-31-michael.j.ruhl@intel.com>
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: 6156c8d3-a41f-4569-a45d-08df127a86a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: qDmKc/Sc3k07Rpe9YRcz0Qyo7BuKvILxcx6zLLIzk1DYfU8aPcNzBhpP6ytNf0G4Gw0LDU44bVF5mdNgb2+5iBhsGAvKE8MLXl11IHY2QKJtbIzls9bS5138u/w65fSRwlialI+nGA2M6x+sUCVrMTVdPMqGS1WCAUjY5l7wF9Buk1xwi9NVCO5r2hpHHfT9eabFyggz97pIf/OZSIbxPA0GWHUZeprUa/rfmLAZf52GvqnzmaFEuCR77V3w1X6Y5fiHlLaMdOG1LOo/EzRzMpqCh8EpAUwGq9VmWGPew7f3wblCXw36+NS2KYnPOY7rPQGkOQxemWpivajfjj2maSNVPZ7IxX8mpstp53FE/GzDdx2UsTj7ieIuEBRt67xxlqYBsXlFde4Dapw7OJzyUVd6bu18oa6Ayl4jGtCdnHJiGCRT50V0WrH/mXF/CDL06KqlCb42TaSzxs9zTcqsb3VKNlwpaL6P2fba4/X21FYOVf/6C/j58ouA6im0FFc2VWawQBB72LX+nlBle5knt6gyPXNwY4t/4dbx5nzd0cK5OE2ZSnKUCi5zKUYCfvrWLmd4+R5DhuL+Vc3BKI0pCvUIQiTHjUip9f2NCtYhdy1FQb7khBjFgra4wSpweFU+9RFYijF5pIj7+1mevVqB9p85tDWcIT5/3hCMk4PhRN4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gj6PV7M1bREsDJX0LZZLrjh3bxWcTGqTQyjkubNGjjeqydrPWMMFMPAxkTPU?=
 =?us-ascii?Q?RgGHUfXVcpW2gy40mrT0l/lz+gVVQycC7APkwAUkCbMNLRLKc7mQ0mLD6lWI?=
 =?us-ascii?Q?e7nS6z+/5WpEvZtDgJ/3hR7P+qfmwZLZ3qyMlls12IAE94qDNsO56tQ0RMp7?=
 =?us-ascii?Q?fVyRnO4+3QBoD214H8M1qVE6UzHAMxGLUtcFp1QbSgTUAp9QDBYUXpTXxPU5?=
 =?us-ascii?Q?zh8sIGaJ2h3bmlD+giGzSlEOROVc+vYLWBpQ+4Pxx2TN3QTEl9FLzav5JRQj?=
 =?us-ascii?Q?ldFUQIUdSlDGY6Fc4rzMTXdUudlulLxthXNDamdk+Fmy9r3VDydoopB7rc3Z?=
 =?us-ascii?Q?IfxFGmVQdirzFX1VEAxjhSLnTX4NIBN54ViBKnff6fFYSJASfoTpaPrTR9Cm?=
 =?us-ascii?Q?xpXdkf3KZG7WAqP7Lt2lLVgD/tOxu1O9/W6NRtmgO3jxzglFifDYl+q832qa?=
 =?us-ascii?Q?AOl3v7ZSOwyDStnJ22lGBMK73WarWDE25EZ5fyhDcZC20O8TBghiT3YRpYjZ?=
 =?us-ascii?Q?YoZrdhIjKyUDx4EYOnodLFRvX5mzethzmQGesmVUvpiOs7w92HOL8vq2kojc?=
 =?us-ascii?Q?sajpW8SSk+9b5L9HnQl71LYQwGJ143MuUWtuqw9huBnnF72sarhLdkgi002s?=
 =?us-ascii?Q?UtyzVjzquCEQxPIBF0NJL/l4ibwrLPluZLiOoj1oGZPkeDO+uXJ2wAF+aJn8?=
 =?us-ascii?Q?ir1AhLyrqwUgGx9DuW3XVWJVz7HutkYvhHOUmWa+zKdhPx2lzRhHyswZkt3/?=
 =?us-ascii?Q?eqDSvIQqIPDDx6Pb42ShYCKNSYBF6I011llJ2sUofVkTYnKgYu+6mnCooqRD?=
 =?us-ascii?Q?s/zS7kJuK4aKXv71xwe2iqLEuABd0gEs+Kc69XGllExgfhoKSskjWUBDtw/Z?=
 =?us-ascii?Q?49OB4AIw2t0MG/98Vb4xzrPXhD9sCJnFWHbrMALJfMIIPMKTYWuACQzYel/K?=
 =?us-ascii?Q?owHddUoyck/kQTuBjRY1u+oMhnfiB5qeeeU/wCGTIe4Dd2Pcx9jU34z3QYy4?=
 =?us-ascii?Q?jIA6kkwwEi0nHlEALhhLTpq5VrNixZ32n3TXM3gDfgmMolkuVDh0rwytNFdI?=
 =?us-ascii?Q?rZ3zJDiXq012EA0ZYO6Rb1lxhZbbFZqjQeOgbOBCIVck0nPd0X4kZKg1tVRf?=
 =?us-ascii?Q?oPjZgxwgLnZA6gjBIG2lk0h/Q/hqilu5NB8WRXnv8lgn+HvV4Dp8DvBfpAD7?=
 =?us-ascii?Q?G2lf0ht2/ix3Gcq5MLIdAZwHcVGq2qTaE6tn0bQQdZe2j82YTgbohI41Kb34?=
 =?us-ascii?Q?SrKPTXCSsFbbucgmh85TTVQ3X3TInIzosMvzFV96DhM5BLVHSKXzeSKaJcES?=
 =?us-ascii?Q?YwT+zfzkqJRlHQ+mOZz4B56+znlwRLAfJC7HZ4T8pgYo/p7+d2Lp5s/k8Wym?=
 =?us-ascii?Q?oIDizViRAjvnEhpScoF8zLnj9+xH78Dx40VRDEi9dGOZA3gVIk9sWQesr7j0?=
 =?us-ascii?Q?llDaDj+ABg/3dlwdeFuglxOqftqowkUc3/BgTdRZEKU4qUwTNY6T6e9arrOv?=
 =?us-ascii?Q?rS1w+BZrWJzX82iz/Rra0XHldMBXsF4AUa90vUrim/KVIRo8iFILow5ABR9S?=
 =?us-ascii?Q?vOEWIUys+PqictlcaZTjpE/aVnFx4d1AU6pmuqpt4jSK0oDVbJfXoEVj0Hfp?=
 =?us-ascii?Q?XpCHZHosylr8gKHqV9C914+qwttY6QniDwqckkeP7t+snrEQIhAvNv4xGqwl?=
 =?us-ascii?Q?O8NGXpBHTSOBsD3veW1Yxfkrq/ar0EkqPgQprmxKxECMoPaAaOyEwiSH8bfw?=
 =?us-ascii?Q?IsEYjkEi+g=3D=3D?=
X-Exchange-RoutingPolicyChecked: wwsRQ/p6V8RSNGVfqSg69Te3r6Wt9gcBErN2bvJjtwoWhYlEgr2SlAaZMwTpS7hDuzbmkYW2A+eij/WnCY59fBD9v5ZEwr+FuGaxFpm6sa3mpbeHwIA4ijLtnO2F4nYY1fcdxEqjgJM6YAB8OcUjmmL+zP+56xbQWxC2Wn2vpc+5hj8gWmxrcGrZpzLBYnaBo663tGwvl3/ZQSzEFEJhxb6W/7v2NQjtk+9Pr5U9wUiEv6vZKYywfcvwwDrHba/sPEn0Ky4ECGv64bK6Fa7sH2tguBArL7Vn+LcQlSeTmrb39qec8y8C1XdZ5AX+gy8vwXKKCAMJ54xifSmNqTQJWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6156c8d3-a41f-4569-a45d-08df127a86a3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:09:16.6432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGeybqrgEgiZ2mqW8bR3J5PSEcaFin+4muK34V9LUs7NgfNxAYtT6YlnnwzM2HBmJdu/ExOE6/zjApQDbpVr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
X-OriginatorOrg: intel.com

On Fri, Sep 11, 2026 at 01:11:57PM -0700, Michael J. Ruhl wrote:
> Add the necessary files and text to use the DOC system.
> 
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/xe/index.rst   |  1 +
>  Documentation/gpu/xe/xe_vsec.rst | 14 ++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.c     | 23 +++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
>  create mode 100644 Documentation/gpu/xe/xe_vsec.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 0247a255f7e6..89f013418cf5 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -36,3 +36,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>     xe_configfs
>     xe_gt_stats
>     xe_sigid
> +   xe_vsec
> diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_vsec.rst
> new file mode 100644
> index 000000000000..1a87548489ea
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_vsec.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=====
> +VSEC
> +=====
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :doc: VSEC
> +
> +Internal API
> +============
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_vsec.c
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 468a221378fa..c0252f5b508f 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -19,6 +19,17 @@
>  
>  #include "regs/xe_pmt.h"
>  
> +/**
> + * DOC: VSEC
> + *
> + * Some GPUs support the PMT feature.  For those that do, this API provides
> + * probe, discovery and usage (control and access) for GPUs that have PMT.
> + *
> + * PMT is usually accessed through a PCI function.  However, that is not always
> + * available, so the PMT intel_vsec_register() function can be used to setup up
> + * PMT usage.
> + */
> +
>  /* PMT GUID value for BMG devices.  NOTE: this is NOT a PCI id */
>  #define BMG_DEVICE_ID 0xE2F8
>  
> @@ -140,6 +151,18 @@ static int xe_guid_decode(u32 guid, int *index, u32 *offset)
>  	return 0;
>  }
>  
> +/**
> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a buffer
> + * @dev: valid Xe device
> + * @guid: PMT GUID (from the PMT discovery struct)
> + * @data: buffer to place data in
> + * @user_offset: a user offset relative to the beginning of the data to read
> + * @count: bytes to read
> + *
> + * Return:
> + * * -EINVAL for VF and PMT WATCHER requests
> + * * count   number of bytes read on success
> + */
>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset,
>  		      u32 count)
>  {
> -- 
> 2.43.0
> 
