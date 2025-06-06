Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E212E20DD49
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 21:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749246596; cv=none; b=TKC+N1QRjqfW5Gelx+uteLjLxtq06oBhcigkETcxQy1b76cgx3XnI4toRxLInfEBOOOhsr/ZMM3Ug4FHzigp2+AwrbACWDluI3hOKc9wu1YeFq1amz9jR345GdDWwShj7/Eb1oCOopiBUsK2ZX3g+G9Iki5wPdzGmcAKWs7sqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749246596; c=relaxed/simple;
	bh=LCDY0orRICHHd2UnAwtpcP/omWDauE2VDzkZc7MZKvw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IGWFFIdQncZm9NiqKnvRv3aJ1dsF+XMmB/wXpETOSS2NS/wJcfomv9GWxoqfevNW7vBlsarqSQprcktBI9Nhf9p6DyLWrBfsMDQkHK0gu6cSRS2paOpEK62Nb10NXDH6wMrmtOL2Z8FlblALNwyb6nqRjRxM3+GPpghxzyV4ohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdkjXUeH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdkjXUeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749246595; x=1780782595;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=LCDY0orRICHHd2UnAwtpcP/omWDauE2VDzkZc7MZKvw=;
  b=QdkjXUeHT7qDQNSWOCJejt9QZf+Rtp4j3cFloMmve54ZDsCsFau9Iko6
   FrW/HGqTnV/1mlab8Yr58WYZpHxagIuZlMEwxjDU8M6+ybgwSufAEtMm8
   OmLdZ5mqWOr1TacPK62G8VjyUWdi7svz9cq3uORRnWDnXje2dr/LAvbx9
   BEP31zhDp59W4jbzyGvfGiEuM8bijdOj9Gicsuuz1tlQ9xzUpQRr1qC+q
   vZwsiW8LtGmFewGjBQMG/mO/0imunTrv2oY4VIo722TpFOp6k6qAfPToj
   eEWUepkko8V0emqYBPjBxicHhWa1TgPO0jrsLFETbS+26cbnmdpPo/fz/
   A==;
X-CSE-ConnectionGUID: aCx86Q/sQ52okroYsfkZtg==
X-CSE-MsgGUID: wEWvOG6DRea+Dav/pyQrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="76799811"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="76799811"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:49:54 -0700
X-CSE-ConnectionGUID: dnsClYC4Tqyp5wM7+iuLeQ==
X-CSE-MsgGUID: DNTcvHx3SRukLegMuyxiuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="146454382"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:49:53 -0700
Message-ID: <b970f20722f050f55acd11eb71793fc899154299.camel@linux.intel.com>
Subject: Re: [PATCH v3 06/11] platform/x86/intel/pmt: re-order trigger logic
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:49:53 -0700
In-Reply-To: <20250605184444.515556-7-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-7-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> Setting the clear bit or checking the complete bit before checking to
> see if crashlog is disabled seems incorrect.
>=20
> Check disable before accessing any other bits.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index 94858bfb52f8..aa3f57fbe018 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -191,6 +191,10 @@ trigger_store(struct device *dev, struct device_attr=
ibute
> *attr,
> =C2=A0
> =C2=A0	guard(mutex)(&entry->control_mutex);
> =C2=A0
> +	/* if device is currently disabled, return busy */
> +	if (pmt_crashlog_disabled(&entry->entry))
> +		return -EBUSY;
> +
> =C2=A0	if (!trigger) {
> =C2=A0		pmt_crashlog_set_clear(&entry->entry);
> =C2=A0		return count;
> @@ -200,10 +204,6 @@ trigger_store(struct device *dev, struct device_attr=
ibute
> *attr,
> =C2=A0	if (pmt_crashlog_complete(&entry->entry))
> =C2=A0		return -EEXIST;
> =C2=A0
> -	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(&entry->entry))
> -		return -EBUSY;
> -
> =C2=A0	pmt_crashlog_set_execute(&entry->entry);
> =C2=A0
> =C2=A0	return count;

LGTM

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
