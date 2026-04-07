Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E7F126C17;
	Tue,  7 Apr 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775594254; cv=none; b=OjXKaBf2D7Ptdl5u6sGd8biguNy7DrBAVXicpH7j7MocRXsqpigCHPUS6eyrC2R6F6281NADu6m3Q/7UEARI3kAztSaI4+U1S/oLJiplxMp7oW/Q9BCCi9SAuQ8YbxEV9sgbiFLBECyhf9BinWA1ckf8l6j+xvSroSfc1acTvNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775594254; c=relaxed/simple;
	bh=8B4Yu6iBfYzVw1yFKzyCXTowm2mECI3FUV6XBwRimjs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIUGcuSMHE4cTYu6BNs1HBhv3Fj3SuWNGbSJlNjGBveVpWgttci96Z8yxMZOhAYxNOkTTuOH3iat1pIALRF5+gV7Fz5pf0ZR5Aq+vcELIaiyHdPO8qUkCrM72GMh2lt357p7PKUX969NayEAeCuJajTP8VE/Mtgg2l26U1cp5MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jv3OV5FK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jv3OV5FK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775594253; x=1807130253;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8B4Yu6iBfYzVw1yFKzyCXTowm2mECI3FUV6XBwRimjs=;
  b=jv3OV5FKcvMC1l6iU1EdT3TMReTx3VNtpOChWJZzXMJovFDSB5ReUxxd
   7F/L3GxZBgNZFJLO8WmLMhrdqMDs8JxsX5MqZZghBswYDI0bPjakLaL/x
   iqGfgzzQ/ek9H/NAZpHB57rIw8YdXGrALzq7AcVdftTS7pCYiaTbz/hF3
   wTvxJpeC1DRLds4vGTDbzMTMgdRy+77cPHMBaP/fOQInzMjf32RvhpzNd
   oooCaQLyR5DCUHXastr3TBfkaInuzHtVuqAB6C61nZfaiNSK5n9IR8V8p
   xOSUAOiFAXKEOqIA30/z20E203CjAVMo/193pIAu8nAGVlYCNbrkYRxvN
   A==;
X-CSE-ConnectionGUID: kRpmzXVbSGeZdC/PDMOUsw==
X-CSE-MsgGUID: NcABSZkKR8SZ8DlR4K0hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76463054"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="76463054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:37:32 -0700
X-CSE-ConnectionGUID: pXKsnu7uQHiI5yHxMHe3/Q==
X-CSE-MsgGUID: tUAibbi9R/6zkLkFDvx6lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="227254963"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.125.108.149]) ([10.125.108.149])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 13:37:33 -0700
Message-ID: <4ff01d1a3de5b392a9b19b5c33d1dd4e2d62e635.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, Maciej
 Wieczor-Retman	 <maciej.wieczor-retman@intel.com>
Date: Tue, 07 Apr 2026 13:37:32 -0700
In-Reply-To: <adVJgJGUGLQ_W4Ny@wieczorr-mobl1.localdomain>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
		 <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me>
		 <c40b5b4b63fbc9b757892aa5927f5c46655b94d5.camel@linux.intel.com>
	 <adVJgJGUGLQ_W4Ny@wieczorr-mobl1.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-04-07 at 18:19 +0000, Maciej Wieczor-Retman wrote:
> On 2026-04-07 at 11:03:06 -0700, srinivas pandruvada wrote:
> > On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
> > > From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> > >=20
> > > Insufficient data is exported to allow direct access to TPMI
> > > registers
> > > through MMIO. On non-partitioned systems domain_id can be used
> > > both
> > > for
> > > mapping CPUs to their compute die IDs and for mapping die indices
> > > to
> > > their MMIO memory blocks mapped
> > > =C2=A0into userspace.
> >=20
> > not mapped. But presented to user space via TPMI debugfs.
> > > =C2=A0However on partitioned
> > > systems it can't be used for mapping MMIO blocks anymore.
> > Again not mapping.
>=20
> Okay, I'll fix these two messages.
>=20
> ...
> > > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency-
> > > tpmi.c
> > > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency-
> > > tpmi.c
> > > @@ -385,7 +385,19 @@ static u8 io_die_index_next;
> > > =C2=A0/* Lock to protect io_die_start, io_die_index_next */
> > > =C2=A0static DEFINE_MUTEX(domain_lock);
> > > =C2=A0
> > > -static void set_domain_id(int id,=C2=A0 int num_resources,
> > > +static void set_instance_id(int id, struct
> > > tpmi_uncore_cluster_info
> > > *cluster_info)
> > > +{
> > > +	/*
> > > +	 * On non-partitioned systems domain_id can be used for
> > > mapping both
> > > +	 * CPUs to compute die IDs and physical die indexes to
> > > MMIO
> > > mapped
> > > +	 * memory. However on partitioned systems domain_id
> > > loses
> > > the second
> > > +	 * association. Therefore instance_id should be used for
> > > that instead,
> > > +	 * while domain_id should still be used to match CPUs to
> > > compute dies.
> > > +	 */
> > > +	cluster_info->uncore_data.instance_id =3D id;
> > > +}
> >=20
> > Do you need a function for single line assignment? Why not just
> > assign
> > in the uncore_probe().
>=20
> I thought uncore_probe() would be less cluttered if I move this
> assignment to a
> separate function, especially with this longer comment.
>=20
> But I can move it to uncore_probe(). Do you think the comment is
> helpful or
> should it be shortened? I thought it'd be good to keep some context
> information
> in here too.

I think static inline should be OK.

https://www.kernel.org/doc/html/v5.8/process/coding-style.html#the-inline-d=
isease

"
A reasonable rule of thumb is to not put inline at functions that have
more than 3 lines of code in them. An exception to this rule are the
cases where a parameter is known to be a compiletime constant, and as a
result of this constantness you know the compiler will be able to
optimize most of your function away at compile time. For a good example
of this later case, see the kmalloc() inline function.

"

