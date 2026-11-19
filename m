Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120762;
	b=4sl3KO0joT9fuPfBKT8+eS5moWeQTN+9Bh0xc3xqJLoPdnJ27c/lwB+Zhjnbhri3DPgY
	 ulizOFP3f5qCApQKVCe4lHmpxssH++WTmFgmtAqhZqoRoAuHNE6homkoNOaZq29sz/LNU
	 Lk7y2TsM3JWN85gjbZEdOz5C3CBdgVxzbPeVAUm78Lk1qVK7ENh+GW878gBstIR3ZMBuE
	 b6GqQyriOZPuRS8KaJ0b0S3dUx0XZr8nx5gnoyUagqU4YKWHxez1cZbHmEV/6cBFyaCHg
	 DBziJaQe88Au77VuL4dt3YJViG4z8yhS5JvvgweBCxV9j8vWut87BcIruu/GP4Raxlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120762;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=wwVdZp9ScMmIP2vU6eN4xrgLismfmCNyEB4/uHTIsSQ=;
	b=U7r2K4JVmZGwukAogJG81Bne2dzR13JohDVqRnmgE6Z1gz6G+TabpNTENseKllw1jVVj
	 pE9VAasmKl1ICd2YN1DdoS7hiJOfnY0NQS+iF6JrQBfIt9TKiMkJ+M8qYsLmd4DiFdaoX
	 L0eXjzn8UZaloPV1uc6nmu1FsfybqyqNHqqvYW/bsDyzOw4dZ/7p9GcD/7dSVKVUc0GDc
	 0kaZuoy7SL7ajFqfvTAfP0fALiLLPxQbeoRk3ZlUQxK4cJUYbW+kqSOtopfhg50suOCdO
	 eaLyUsf/uzp/19SwpjUYfw/uPYhlzNhKlHNAAcUz7+sWUUfX/CP62CVPQIFJUwEPyfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NZzSJeda;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87F606A93B
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 20:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A87F606A93B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NZzSJeda
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795120762; x=1826656762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iMn58lHKxnytTGr2GpCoeK50nG0MNBEAmBEZvIdrmqc=;
  b=NZzSJedaBAMITixcPKUYnMwGWouqEBp1Yy82oRv/obNNPFmsgs7vM8mh
   D5sC3DTlWl5N4uD0+tXz5MfTxeXMggVm07tx1Gr9LKh+J45cuQh8FRkd4
   IbNFEN0KHK8Ueyf3jHefJZEKQnwabWau5HYgz/GbFkgiR5Y8R7sP58axU
   jP/TOqTfN6IHa+EuErnQeIzOrXMDmvGhFqRgexgp33jsXxqaOsGKR8FRg
   hj6CKdWfOvWmdOfYuUeck9fRBJEXUXO4xpwOi+cOFi6FNNhGBqBzGVHUA
   XaN0KmUFTE2hWGhopJbnFE8vv8fPAIRq9zS0J3QzknMye/UoarQIAcTXS
   A==;
X-CSE-ConnectionGUID: KgKXHH00RP2QK6ghQ+jNlQ==
X-CSE-MsgGUID: lwvXzLXaRnOwPDDCEkZfhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4021029"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4021029"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:39:22 -0800
X-CSE-ConnectionGUID: CcT2RtpTTNWiVLY1VtvVXg==
X-CSE-MsgGUID: lTjoDVRHR5ORO/Y2BJ1ywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10423586"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 12:39:19 -0800
Date: Thu, 19 Nov 2026 22:39:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 4/4] platform/x86: dell: dcdbas: Validate the WSMT
 buffer description
Message-ID: <av9edOiWE-rw-WaO@ashevche-desk.local>
References: <20261118035638.11773-1-rosenp@gmail.com>
 <20261118035638.11773-5-rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118035638.11773-5-rosenp@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 17, 2026 at 07:56:38PM -0800, Rosen Penev wrote:
> dcdbas_check_wsmt() takes the address and size of the firmware SMI
> buffer from an SMBIOS OEM string or from an EPS table in the BIOS area,
> and sets
> 
> 	smi_buf.size = remap_size - 8;
> 	max_smi_data_buf_size = smi_buf.size;
> 
> without checking that remap_size covers the 8 byte semaphore. An OEM
> string such as "30[addr;4]" would make the size wrap to almost 2^64,
> and smi_data reads and writes could then access memory well past the
> mapping.
> 
> check_eps_table() also accepts a table with length 0, since the
> checksum of zero bytes is zero, and then trusts the rest of it.
> 
> No firmware is known to describe the buffer like this, so this is
> hardening against malformed tables rather than a fix for a reported
> problem. Reject buffers smaller than the semaphore, and EPS tables
> shorter than struct smm_eps_table.

Now the commit message reads fine.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


