Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894409;
	b=w8PeIQEF2AT8Ux/tui/Zw77QJg046s4UhQ/yMICfHW0zT58Yp4e34xGgGTkFPzqJnvHP
	 ipCKY9irsdsbyv+miPitcN6rt1LWowzeSP645Pp1CuilaZEoPaZWK3FLzDJQKhqF6bLiP
	 XA+oaNAp3j80ZUE5GtMYUSOZFiQkXnWbdSElrxeWChM4AY41ouLn3Q69Fx39nwUzG4ZUY
	 8SBM4M10NywgSQQ55xKGbf34V16s2kNwgAL2PKQS6TxqqvJhyK2/i6/5VVq3QIK9Pjtx+
	 JMKKWmSl3/MzkCz734B8W1mIOB+F7A2w1NNo4cAFPnm4qSxJocxYp/By2N9PR0cu7oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894409;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Subject:
	 From:To:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=On4JqE++qSJrLAuuQtRoTbIqv1RZRTko5Gv+lkYw2oU=;
	b=pcQ+oCmzmJD3auNj+4VNr+QboOkStPuwrYKuZKHd0rP+FKcij3T65QZQLUn3shdesqEq
	 8m/P5kBfqUzUzkCd6xymcBfjzZZKIs12oLmCBlMc2j0CpfbwWiM5Hio9Og2hYsPntba08
	 E1uYkyogtfWg8SGRe3ZrDlHMy5d7xIUTcJBBQgyp522cZn1lkEaOBvEApF+GuV8/WrTP3
	 8mGoz1Hbw+Y2uAu7ECXC/rmA8Yq0LC1AB5f8/RzkhOadmdFHJjCtWPdbV+GnvfhughLRd
	 /gp4Du8itp12OxP/comI0I9dOSe5Q9rWIpwt94D7yMx/TWt7PjoM1+Zl4FrfgQsYK8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XlzfrV2q;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A675A606B445
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 16:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A675A606B445
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XlzfrV2q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894409; x=1825430409;
  h=message-id:subject:from:to:date:in-reply-to:references:
   content-transfer-encoding:mime-version;
  bh=RmyFsLmXjh8O816rMSTPhGa4VACOea7qOMusS/o9Odg=;
  b=XlzfrV2q4b+bLhKGKp+VfO11kpS2PoQ3PRIzQXzoqIgkJTwPv0UqfCTf
   Srxccno+eVo3JHc162pIHPlwD8KLqgJYskA/0Hfq2oc3vQ56sPiaLM4r9
   SKhO+IVkjKSB0qZEm1refDm+7jhFI3zmybY4v09i9uOFkPOl0wqnebpMw
   omUACq/KmPkZ8FA0dlaCZk63+c9YunbOQwVaJgGv6W9F68sX/yynOJvZj
   kfF2sqa68V6DoQrmihQIZjp2dzopeflxypCMPziAQF5n4LLZjvFZkrvPE
   onN8aSSLmWq0wpmtEO2G5O7O8eNWCDHmc6ibLGGNuKW8lFtQVU9bWNTc0
   g==;
X-CSE-ConnectionGUID: udPHJ2QMRI2ypFqP6DBCzQ==
X-CSE-MsgGUID: 1aul9ucrR3WphuHPtAbpZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2694017"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2694017"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:00:08 -0800
X-CSE-ConnectionGUID: tdIzuQzSS8S53wVmF20A6A==
X-CSE-MsgGUID: BHnPY7MRSYavbn61OdE+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7100309"
Received: from spandruv-desk2.jf.intel.com ([10.24.80.14])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 08:00:06 -0800
Message-ID: <233d4609e8c62e6f62d93af11789d38c150e1c0c.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?=
 =?UTF-8?Q?_=5B=E5=A4=96=E9=83=A8=E9=82=AE=E4=BB=B6=5D?= Re: [PATCH]
 platform/x86: TPMI: clean up CPU mappings on offline
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Li,Rongqing" <lirongqing@baidu.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>, Kristen
 Carlson Accardi	 <kristen.c.accardi@intel.com>, Tero Kristo
 <tero.kristo@linux.intel.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>
Date: Thu, 05 Nov 2026 08:00:06 -0800
In-Reply-To: <62ad2e7ffbbe4a4b8ad4cc76dbfc8f99@baidu.com>
References: <20261104032724.1824-1-lirongqing@baidu.com>
	 <245eea039c692d03736fcf2ca2448a271fa135ce.camel@linux.intel.com>
	 <62ad2e7ffbbe4a4b8ad4cc76dbfc8f99@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-05 at 03:09 +0000, Li,Rongqing wrote:
> >=20
> > On Wed, 2026-11-04 at 11:27 +0800, lirongqing wrote:
> > > From: Li RongQing <lirongqing@baidu.com>
> > >=20
> > > The TPMI power domain driver adds each online CPU to a hash table
> > > and
> > > its power domain mask, but does not remove either entry when the
> > > CPU
> > > goes offline. Bringing a CPU back online can therefore insert the
> > > same
> > > hlist node again and leave stale CPU mask state.
> > >=20
> > > Register an offline callback that removes the hash entry and
> > > clears
> > > the CPU from its power domain mask.
> > >=20
> >=20
> > Hi RonQing,
> >=20
> > Thanks for the patch.
> >=20
> > TPMI feature doesn't depend on CPU online/offline and can update
> > MMIO
> > while CPU is offline.
> >=20
>=20
> However, could you clarify why we need the CPU online callback in
> this case?

When online we read the PM logical ID on that CPU and store it.
This PM logical ID doesn't change after offline/online.

Thanks,
Srinivas

>=20
> > Instead of adding a offline callback, can we just do the below if
> > the
> > cost of search is not high?
> >=20
> > diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> > b/drivers/platform/x86/intel/tpmi_power_domains.c
> > index d89b9894c42a..dadd5fc5719f 100644
> > --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> > +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> > @@ -201,6 +201,8 @@ static int tpmi_get_logical_id(unsigned int
> > cpu,
> > struct tpmi_cpu_info *info)
> > =C2=A0static int tpmi_cpu_online(unsigned int cpu)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tpmi_cpu_info *info =
=3D &per_cpu(tpmi_cpu_info, cpu);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct tpmi_cpu_info *entry;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool found =3D false;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret, index;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Don't fail CPU online for=
 some bad mapping of CPUs */
> > @@ -212,7 +214,14 @@ static int tpmi_cpu_online(unsigned int cpu)
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guard(mutex)(&tpmi_lock);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpumask_set_cpu(cpu, &tpmi_p=
ower_domain_mask[index]);
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hash_add(tpmi_cpu_hash, &info->hn=
ode, info->punit_core_id);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hash_for_each_possible(tpmi_cpu_h=
ash, entry, hnode, info-
> > > punit_core_id) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (entry =3D=3D info) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found =3D t=
rue;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!found)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 hash_add(tpmi_cpu_hash, &info->hnode, info-
> > > punit_core_id);
> >=20
>=20
> Your proposed change prevents duplicate hash entries, but it does not
> address stale CPU entries in tpmi_power_domain_mask after a CPU goes
> offline. Could you also fix this issue?
>=20
> Thanks
>=20
> [Li,Rongqing]=20
>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain_die_map[info->pkg_id =
* MAX_POWER_DOMAINS + info-
> > > punit_domain_id] =3D
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 topol=
ogy_die_id(cpu);
> > Thanks,
> > Srinivas
> >=20
> > > Fixes: 17ca2780458c ("platform/x86/intel: TPMI domain id and CPU
> > > mapping")
> > > Signed-off-by: Li RongQing <lirongqing@baidu.com>
> > > ---
> > > =C2=A0drivers/platform/x86/intel/tpmi_power_domains.c | 19
> > > ++++++++++++++++++-
> > > =C2=A01 file changed, 18 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> > > b/drivers/platform/x86/intel/tpmi_power_domains.c
> > > index d89b989..c3fd1bd 100644
> > > --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> > > +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> > > @@ -220,6 +220,23 @@ static int tpmi_cpu_online(unsigned int cpu)
> > > =C2=A0	return 0;
> > > =C2=A0}
> > >=20
> > > +static int tpmi_cpu_offline(unsigned int cpu)
> > > +{
> > > +	struct tpmi_cpu_info *info =3D &per_cpu(tpmi_cpu_info,
> > > cpu);
> > > +	int index;
> > > +
> > > +	if (hlist_unhashed(&info->hnode) ||
> > > !tpmi_domain_is_valid(info))
> > > +		return 0;
> > > +
> > > +	index =3D info->pkg_id * MAX_POWER_DOMAINS + info-
> > > > punit_domain_id;
> > > +
> > > +	guard(mutex)(&tpmi_lock);
> > > +	cpumask_clear_cpu(cpu, &tpmi_power_domain_mask[index]);
> > > +	hash_del(&info->hnode);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > =C2=A0static int __init tpmi_init(void)
> > > =C2=A0{
> > > =C2=A0	const struct x86_cpu_id *id;
> > > @@ -249,7 +266,7 @@ static int __init tpmi_init(void)
> > >=20
> > > =C2=A0	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > > =C2=A0				"platform/x86/tpmi_power_domains
> > > :onl
> > > ine",
> > > -				tpmi_cpu_online, NULL);
> > > +				tpmi_cpu_online,
> > > tpmi_cpu_offline);
> > > =C2=A0	if (ret < 0)
> > > =C2=A0		goto free_domain_map;
> > >=20
