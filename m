Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53D4AA003
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2026 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788376291; cv=fail; b=N0nFKj8w0r+xFnEX87ityb/1EOLf7ZrpX+8+LIhcKjI2+ksHZ5VmOKROgP32iKE8UhXb6/uG0JPVJLQjEBGBFd4SRoXTXxWlWs8+GxUdPXoSoehs0b3xh/gx4sdb2/z61KU+VY4oxgBIwzI8CKFx082NC/vhGrvVmsgdx4RUBNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788376291; c=relaxed/simple;
	bh=/abu6Scxr0VNn9RyctJ3h1wlqE59QrVNwE860ZhWzUk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EBdWJps8KrriHtdeCW+c87jynljAsH67Y9CYaCoP9hCGLv1Bnl+KATQFoTByBtIitET6tOtNeZZlcxUKo47otSw+j1Y404ukjVoLtvneAovX7PXexqOYwRJoFR9urfSqUGZFSxJ+VgfLSjIx0pG4CiNBQWm7JeZqH3CxpMk20vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QemYWXoZ; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QemYWXoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788376290; x=1819912290;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/abu6Scxr0VNn9RyctJ3h1wlqE59QrVNwE860ZhWzUk=;
  b=QemYWXoZ7IuTeC22V9zQGc7QuP3VWSzbRgOOcf8pvMalUafAF9/hOwRH
   gXrmKm80W+r3Sq7YtlXKtrnXflOfa9wGeQNfj9MRnmfYftFvvv94AzL4d
   unyurW2hdKLkGU4uqN/5eSYsN9JbNjlgF5YZs3ifD9530Uq51EvwhxyQf
   hBtauePzJr1Z7grwn2JfdF9g41z/0D9DxLnxU/XLIEk0rEkG4zk9TRCdL
   3Ji5iNA9ItbV8Lj0he92/OAdkVtayIOjabTfABMtha/Uv3Bw5c4bsmar7
   Llxn1ZbpxsKbbj0QvpJaxPwpEnk8L3/UeS5vSOPlcV6Bgu9QcLlpDdsun
   Q==;
X-CSE-ConnectionGUID: BgS0i3dpQWyWQFJkTI2lBQ==
X-CSE-MsgGUID: r50P5T9HT7CPYNAhw7JOHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88695345"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88695345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:11:27 -0700
X-CSE-ConnectionGUID: ORfbQNasS/GVja6OhongKw==
X-CSE-MsgGUID: /XWHqQ1OQqSwikGHVk/u/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="263330282"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:11:27 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:11:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 12:11:26 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 12:11:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y9rxTuSbt7gwfU/nqlsovNOmDvca8hzKxLZL0+M9KPwDwwpZpI4LkoysbqsqzONaB9PnVqJ+9Xupf6zQM+j2RjZPhHgy+QRUbkFBsxWZrT834Rsjx19SIjiUTHKy/H9xw4ndW7j+4xloQrYMzDmZRrdM6nL5IsNBktWrXYPh3Y3ZNjs0735OCaGpTEG+cEM6qKFbDOJw616WDlXqmzbJf3ASwu1R8Olrzg1cH1vbeErTgomHlpmIqARXSQFXyOE7YhxhuXR80JbhMSWU0aL5HiMmprZHbyCBdaCv3QBIH1yvtY22w0Fc/TKrib71MULd5UiN4GQjHuRVDHvstqiKhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9lhVbOAXFOyJAQsbwHBZRvMzr6tKPjzMEjE+OuQvwa8=;
 b=P35EM+XhqcjX0eQFqLY+PZ3CHNDoKJ6SFkUsctNxKXQeMj6cYPhYD1dKbz+eWNKADV/wfunHNpPYk+osCsIpxEBK4wCRibcIr5na/80Fkom/JL0pGOSGgMdqp0ScZ+in3ANEnww2GmE7Ho4D4g7/y1W1s2urAgPdRCYKHejhaUg6rWHeSTY5TiSfxPgCq8/O7ZNst/2etrTsFkUia9j7z0Rr7iAIWynwPJ49jYSxHe3Kner7VogG7RJ/DJ/PN/yFbmH6MfYAuSeZo4a45I7wbBfytLFaVajolCfQiKJyPMK+R8QuTD68TGy+aQz5xuubemRXwx5glGqJRUgzwkJrHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF37792A6D2.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::820) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:11:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:11:18 +0000
Date: Wed, 2 Sep 2026 12:11:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	<platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
	<hansg@kernel.org>, <ilpo.jarvinen@linux.intel.com>,
	<thomas.hellstrom@linux.intel.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<david.e.box@linux.intel.com>, <anoop.c.vijay@intel.com>,
	<badal.nilawar@intel.com>, <matthew.d.roper@intel.com>,
	<james.ausmus@intel.com>, <karthik.poosa@intel.com>
Subject: Re: [PATCH v4 08/18] drm/xe/vsec: Correct locking order
Message-ID: <aph00omQQiyyMIBC@gsse-cloud1.jf.intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-28-michael.j.ruhl@intel.com>
 <aph0K-m2M48pvEZd@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aph0K-m2M48pvEZd@intel.com>
X-ClientProxiedBy: MW4PR03CA0176.namprd03.prod.outlook.com
 (2603:10b6:303:8d::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF37792A6D2:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9c261d-bdcb-40ad-49e8-08df0925f74e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ipPCKg3eWxAcJqsJdp6LydMDgF3rdqgBqbQpP2W3MRQmB4kC84IvKlyklOmaU8UxpU3dG3/9XRH/QRtZTaD8KLXRpxYmHR4UcXbRqYA0V4Ix8cRQQY9ivtdBN5obqhjTGvxPSbQuEbviYhJ5jLMN6Bmgob6JYzyJl0fdh9BXgyxBfJfDSfoNd0xgkuV/tC3O0MxUGVc1V9dxjOn8Vv74Byl6RwkOE/4rUvzeAUEAFYOJqvSr4vlJx1qZNXJyOqVhTB4CFwRu3wUZ9gqMD/X/5YBvB8yL3U7Fu7G0DXdqD1sHeAKBZFDaX0hCJpyoi3uVdWvW+xopeGSTBdyjRwaIFRHGhj7RoIBpEP+OaX0ZTaLgquP0RGlvbs2XWgbkBmMiKQdBlahJvw81jnUvGxTaq32PeXNYShimKxDnn4WVTrUcp8k9cGQOnZNxstdpibEmuHNrAhXnXtzrnEirh4sd9WSXUBGyRHp+/CGFfSWahvsimPuLyN7pJBr4raQiX2aOXZomSKBrFZ5/GZTi6RI8Wqc/OkwC+8q5WfpF5rAuBzc9LGxXQ8S5fw0EgtDNxd/2kXcBPvT/C2LIMYpbF7uCnuuOQS5FGgsxRvyUmoCgtMu01TztRc0DObJ845W6mUCUSBj3mUIlFVyS5qkkt5TxLTf5S4tT9OsNPY4jxaWhE2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Suaf8iAj9e6ywGGjArV/SV1/CJRK4d/HjPxTtUEqAQcmEv0mQ8czD//rFaO0?=
 =?us-ascii?Q?Sk/m1HatXEQkx7UgZwdQp7H9IcyqaoK0N4kDEYa01D2O1NWZ636E6rqT93+j?=
 =?us-ascii?Q?bBRqmjO+o2mlSoRlaHi/nbaTXjfb2NkFtmxFvpN7+tM5eSy4EieI0Xjsn8H8?=
 =?us-ascii?Q?kuJV0kiyP2o3YYFBJo/aENgel863D+jsmKJ6kCGOjhsI2YBn4Nk9zscsY6h+?=
 =?us-ascii?Q?jw+1VX4QofyeGEZfYzz9Ta0GkZxl4LcjP72QtIrf142MHF+ylFqFavdS9XBs?=
 =?us-ascii?Q?yv6jdz61P+hwksSgtWi4etPfw/8B6R78xONH9hIesv5ZXDXf6WbYOFUiUv4A?=
 =?us-ascii?Q?MFT3PZr5Awj+Nwzhjz8XPI3KCaWkWwh41XM0/aaSyt+xdFIKLut7nLPbOOTc?=
 =?us-ascii?Q?jmpWncVrATUrtoEXH5pfHqv6pM7oHuV+UH0jpZYG+uWTph0BHCzPVoRmR4Ti?=
 =?us-ascii?Q?6355XBcwx98qbgcsXtB1aKJote3baGq0ce4mFPRxQWLtG/HviBcP/FOAAIJU?=
 =?us-ascii?Q?xv6TCY32og3HR6c9DpehSFdTfa0ur1qYGdsbQnvrls1lh+TMch5eP/qZ2/mg?=
 =?us-ascii?Q?6h/3pmFbGhXshmHGU3vHxO0RroNBYZ04N/EffrNp2cPlaLzUWryr5+0gG+fk?=
 =?us-ascii?Q?uOJ4siuJV865Cy/ITvXH/lD8FNprg7gVDKOp9KbuOWdXKqeNKbgdRQXDV0HG?=
 =?us-ascii?Q?rqyQdlYAOsK9XJcytr54y3+UWGmghJA/vePhwyv8xj6zRUqaDzz36l6FTBq0?=
 =?us-ascii?Q?6LAjthg46QTi5gf92o06dO64XX1kMVR7BCTb7zDbjEsMDTFPMnrL3Gl3oErL?=
 =?us-ascii?Q?ExwUhBdFi0Bt9StDs1paXe1CKai1bMT8eh7t0lxgvt57PUetY65xIenrl2Ae?=
 =?us-ascii?Q?MTZv+2HDhf9EQASI2E/mr1t6dtG0WbagPjq1SA/owbW6s/NSd3YmD6ewBFSp?=
 =?us-ascii?Q?wiYdwoiM18uGmHjs3v60uhRwDA2fIDnx+NPY/Y+GbcXuV0cL8nhQH8Dk1tkh?=
 =?us-ascii?Q?dR7v5ZvxSKxHaUnEda9DQSGNEqRNl6AJ8SkDuQCY6Ds/EEFephJ5xAKEcrfI?=
 =?us-ascii?Q?ik67VR0L5uXvi/dlIKTIzjvSEiVo5KZG08QFJsW19WMS7Cq2dZTmC0UEPIGZ?=
 =?us-ascii?Q?GkYec9y1AW+dHsXiN2s9HWfA3xPLltXKfZGy9wT5LW+cVxw/hRMFhwwfZwJz?=
 =?us-ascii?Q?nn3fUfonBRb1ZWqN4I1/6ssMJ2wsaz9p2OKN6cqLgK27vRtMG3LHa4ypbJwx?=
 =?us-ascii?Q?S81dzyZWzU49OUM5gKoKw7Ay1ffq7jgXfXkh3HNaMhIWIwvOnZ5AOVjnEJtk?=
 =?us-ascii?Q?o19i5T4B11rqZ7XymfMwWrB5EZtAHoA05nh2VdhKyCUAqzUAbzOR9Z2e/COZ?=
 =?us-ascii?Q?EAXSXFV0HtyqJ+M26VdHP9kDfiEekjE1mS2KD99KgDE5zEtdHp3eWuBhxmaE?=
 =?us-ascii?Q?Yq92ubGHCfj1G50vlcD4XIIXOpq4YarV2/4Fba6znuVOz0mgLKSzvn4Gstch?=
 =?us-ascii?Q?sBsIBWM1riWgJ6ME6JVQk2vVkdSA0JF13drD3MoT2CLghHO6cUVnP/aFlM7w?=
 =?us-ascii?Q?IC9nlccdbsNQ2yBflklOOpMKpeQxWB7FvHyOBijStSu1vj8VGbe8+RRyzB/P?=
 =?us-ascii?Q?F0QMcF7LmskIqh3l0QMonCdMbpmEn3f5p7kmOZdH+hFVgpcHIUr1EQ8L5iw/?=
 =?us-ascii?Q?EJX8Ch07u8PzCtS4Uf6jS47/YwIaa9SNbo1aZMDqmqnbxtTwqvReUlL6lksO?=
 =?us-ascii?Q?zBWJXCYkhIdMwIYFcsvcaRenmZFyCjg=3D?=
X-Exchange-RoutingPolicyChecked: K8g8OsAYVR7WV/7Asf4K6BDxAWwE5jUKHpQhnm89lCr1aaP4sDeK1Ag+0OdRzxjImiCVivI5Z8ukmqs1+hGe3uElYU2MXqt0DtkmAkfLq+aKCywK9VcXoMLMWl1jwHahJmkL3hYjotdrMwAavQ/rTJb1yD099jlKbJpTy+IYNOUI+ogeL8frCpb7McXHL3JJnfKbmZOiMEBILiIjf83q2x1G3+iUbvBFDQRMb0Bdvh8UQXALvKNJLh2mZl0Bj8OOOC/W9yWfSbtYAFjo4cF5C87ynSsoUifirRLgm7Zxq9KZRG8bRKYrYzRi7vL5By9Q8EHzhJxEHwMd2bRKfer4Kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9c261d-bdcb-40ad-49e8-08df0925f74e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:11:17.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FXHgY1GeSUG3zfTUr5Jph21sV/nXARIvo0vEvBFkUdE1a/hQvDSfcgXGELF72ArDKluFOhtrGvSG0saO+hbhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF37792A6D2
X-OriginatorOrg: intel.com

On Wed, Sep 02, 2026 at 03:08:27PM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 01, 2026 at 12:27:43PM -0700, Michael J. Ruhl wrote:
> > Xe locking order is power state first, and then local locks.
> > 
> > Reorder locking to correct usage.
> > Use excplicit functions because of multiple locks.
> > 
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vsec.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> > index 71bc359b2ad1..dd7723ba6c1c 100644
> > --- a/drivers/gpu/drm/xe/xe_vsec.c
> > +++ b/drivers/gpu/drm/xe/xe_vsec.c
> > @@ -158,16 +158,19 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offse
> >  
> >  	telem_addr += offset + user_offset;
> >  
> > -	guard(mutex)(&xe->pmt.lock);
> > -
> >  	/* indicate that we are not at an appropriate power level */
> >  	if (!xe_pm_runtime_get_if_active(xe))
> >  		return -ENODATA;
> >  
> > +	mutex_lock(&xe->pmt.lock);
> > +
> >  	/* set SoC re-mapper index register based on GUID memory region */
> >  	xe->soc_remapper.set_telem_region(xe, mem_region);
> >  
> >  	memcpy_fromio(data, telem_addr, count);
> > +
> > +	mutex_unlock(&xe->pmt.lock);
> 
> what about moving this block to a function and keeping the guard ?
> 

Or:

scoped_guard(&xe->pmt.lock)
	memcpy_fromio(data, telem_addr, count);

Matt

> > +
> >  	xe_pm_runtime_put(xe);
> >  
> >  	return count;
> > -- 
> > 2.43.0
> > 
