Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031810;
	b=XiZiboDV1GuTdW8yHDgoX9wLUOOFCYX0IDdvhgnmdZLD8Cy/LzrNjnyfQqqx8LoGFlKJ
	 OctNWC+wdhNKWQNxUcGDh0Uois59A5m/zT9ngiS5xs6UDX7QXyNVSpvxTqOa2qN8+p4zD
	 zh98X9gU82gvH1Xw1UExJ1iAvIRUCgQd4JZ/JZUK+l/Wwqa7udfyvkU0gTc/jG4Wminfv
	 R5FvnWWSNIEIqJmUPPiuav922h+ButsuuGq1K41S/3m6u+u/N4eLSAkwC3rVz6c/alR1l
	 XeE+IzwRgujAoHS3puGenr9zfddN9jpVWzmtvooFchU43NeLqHsTRgJ5uJeFWOALHJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=gUXOHyLcsFXk/O24U7fuZclmY4LgxatpXbcTq50nP6o=;
	b=HtmUIY2p4E1fpTzhFzX/7unDZBtNCZL0zOZKIm7gqjSeX22LVsGc06jCuz19kSRMygE4
	 C4v4BxSNmOdmFrxFz+GglCsX/64mJkf8FLkVAB1UTXUDaMstFoyujZ4as1vmn52vOzFWI
	 2O2stZ2gJr49ASF6VLG1hH+u+a16S/2I5YarqkhciN4Zw2ESur4T7rzVnlMFC/lnUMjha
	 DJ8c3zKyX387ogHkU6CJ2E4M9WVtaEvuuU0DY/29WaIJLXH7ntrpodi3IXR3cVXflKbWH
	 btd8BNyewBE5xNONdmURhwliTDAK14jyxSqD2tdFJO4/DJrxt1iWLRv8q5eomlqqkgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZtEe6u85;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9425606A33E;
	Wed, 18 Nov 2026 19:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9425606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZtEe6u85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795031810; x=1826567810;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=3sIpO0gR35KD6/+/IusCzYwtfnnCc+TXT8r5zacW80Y=;
  b=ZtEe6u85+h7NdcH0UYK0kPouGhyfT2g7GM5bLrekAOJjVniL9xyUwC3I
   ybPrstN12jxANmTIPANTB4X0a2ja1TcwjsUB9o+RZMCnT5cEHD/Baqp9O
   IK2hDkjUBIKtnuljJPcqorWPweVBJovVQHXCKdCOCFKbpIZQxAMyonayY
   EwUbjBpXBptWQt5QV7QKRQveX/kTlrjgWQsosXGJisCJ2YUHR+nDm9PLr
   w0eTNOeGP3RjasleRbTw4qLuZYb1zWOKlWUT8fH2LnDt46rLqZyiSZxA2
   4p4nOOsG81A3xhQ2TMPYcqalAH3NkADmB79X+fEIdOPZM7SwgfE3keNfe
   g==;
X-CSE-ConnectionGUID: aajzLz2PTbqm3QRFirG73Q==
X-CSE-MsgGUID: TsFpO8q/RUK9FW6TgJY2ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3854627"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3854627"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:56:49 -0800
X-CSE-ConnectionGUID: J46hfKmIRm+MoUYbri/aFg==
X-CSE-MsgGUID: bhUcr0xGRZKRG56YWaGzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10231965"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.239])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 11:56:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Nov 2026 21:56:42 +0200 (EET)
To: Mario Limonciello <superm1@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Ma Jun <Jun.Ma2@amd.com>, 
    Evan Quan <quanliangl@hotmail.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/amd: send WBRF DSM payload as buffer
In-Reply-To: <fa625e27-a1bd-4a22-8611-cca13fc9d11a@kernel.org>
Message-ID: <8161ce9b-ea0f-5a05-f99e-efbad38e2979@linux.intel.com>
References: <20261102-superm1-wbrf-v2-1-28b02bb4ce61@kernel.org> <fa625e27-a1bd-4a22-8611-cca13fc9d11a@kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Nov 2026, Mario Limonciello wrote:
> On 11/2/26 14:58, Mario Limonciello wrote:
> > Spec defines the WBRF record _DSM argument as a single buffer that packs
> > the header and frequency ranges. The driver instead built a package of
> > integers, so firmware on some systems abort \WBRF with AE_AML_OPERAND_TYPE
> > when dereferencing Arg2[0].
> > 
> > Encode the payload into a little-endian buffer and hand it as the lone
> > package element.
> > 
> > Fixes: 58e82a62669d ("platform/x86/amd: Add support for AMD ACPI based Wifi
> > band RFI mitigation feature")
> > Signed-off-by: Mario Limonciello <superm1@kernel.org>
> > ---
> > Changes in v2:
> > - Declare payload with __free(kfree) at the kzalloc() site, after input
> >    validation, instead of initializing it to NULL at the top of
> >    wbrf_record() (Sashiko)
> > - Compute payload length with struct_size_t() so it no longer depends on
> >    payload being declared earlier (Sashiko)
> > - Link to v1:
> > https://patch.msgid.link/20261102-superm1-wbrf-v1-1-b58d8d85277c@kernel.org
> 
> Ilpo,
> 
> FYI - this was found on some existing systems in the wild so I would prefer if
> it could go to -fixes.

Okay, thanks. I'll consider that once I get to processing patches once 
again.

> I sent right after the merge window so just wanted to make sure it's still in
> your queue.

Patchwork URL is in MAINTAINERS, though LLMs hitting it might have made 
only part of the queue visible to non-users.


-- 
 i.

