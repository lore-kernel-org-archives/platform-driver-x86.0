Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A661E231D
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 21:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749244445; cv=none; b=X0yoX78uorITgirOKx3yNGn8BcwqEBIsaJWnW7NKXXVqPZ0yxiIkkf824nyVo2wunHx3PiDBxqlZfnpxYmefdxbgnty5efj6c5/MQ2ZPWldMsmDjbPVsqPZtE6dxCsL4BHxYASxYmecsJ+wWjRXVzmRjww5YNWhKDus4zBlp/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749244445; c=relaxed/simple;
	bh=dKocegu1RoKqNsUiRsL4JZ8am3/3Dpvrr4Mek2kK+og=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AAtwNBBNkf1126brLPTubf99pXOWsrXap+vak3yinpa3QXk7l5mSdgccxiO1iZrNjCk6Y/QysISx07a4qAsmPb4qLya0NK9nEb/giX9ss784Ulbb2g7GdvDeVNC98+qFxBitFj0I+yOG8UgYLFRP+iN03IEdidjVfz4mUt7JmHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHaG87qZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHaG87qZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749244444; x=1780780444;
  h=message-id:subject:from:reply-to:to:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dKocegu1RoKqNsUiRsL4JZ8am3/3Dpvrr4Mek2kK+og=;
  b=mHaG87qZqbxWbGMyx1IibjEbPUbeHzgjoZlF1NVdXk0b7wrAB/B+zbbw
   jJFs8g+R1hkqcX8RFKpMeb5NbXtPwswSHV1f2Ge/2nNBVBg8fgOaQUKyb
   neMWUmpv3wfNbSbmH1dPN6Jylmp2O6Xh4d2vqBITmJR4bZu28XZK0icI8
   oBOXmmJ7qqVx6+a9Lq9xehxNp3XgNZovWfXAcE+wY6s3m2Ht5xJiImjGt
   LOx7FLCRIlcxyaPF9gVnKbGnACmRfWUZbw8j+Pqh49sgEmv37XxcYYFT/
   9mAMhkvzpMejosXMGAJi25eiVN5Qd/A7gJwBYJyi5moFsy/RuWfAJg55P
   w==;
X-CSE-ConnectionGUID: 5ZtukC6gRZCe1XQc0Ii0Yg==
X-CSE-MsgGUID: fButjZC3RZmLK0oE6mnEqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="73932935"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="73932935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:14:03 -0700
X-CSE-ConnectionGUID: wohOPFd5SKG9KOdYu6sHjw==
X-CSE-MsgGUID: 4098TrMiSWG+3bWPNYsTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="149759530"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 14:14:02 -0700
Message-ID: <1aaee1ffddf26619f045ef82789385828e8bdde9.camel@linux.intel.com>
Subject: Re: [PATCH v3 04/11] platform/x86/intel/pmt: white space cleanup
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:14:02 -0700
In-Reply-To: <20250605184444.515556-5-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
	 <20250605184444.515556-5-michael.j.ruhl@intel.com>
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
> Noticed two white space issues; cleaned them.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index 74ce199e59f0..e997fc48b9ce 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -143,7 +143,7 @@ enable_show(struct device *dev, struct device_attribu=
te
> *attr, char *buf)
> =C2=A0
> =C2=A0static ssize_t
> =C2=A0enable_store(struct device *dev, struct device_attribute *attr,
> -	=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +	=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> =C2=A0	struct crashlog_entry *entry;
> =C2=A0	bool enabled;
> @@ -177,7 +177,7 @@ trigger_show(struct device *dev, struct device_attrib=
ute
> *attr, char *buf)
> =C2=A0
> =C2=A0static ssize_t
> =C2=A0trigger_store(struct device *dev, struct device_attribute *attr,
> -	=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> +	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf, size_t count)
> =C2=A0{
> =C2=A0	struct crashlog_entry *entry;
> =C2=A0	bool trigger;

Reviewed-by: David E. Box <david.e.box@linux.intel.com>

