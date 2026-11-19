Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099384;
	b=QTyHdK6Ok3btgZXCLTRZxuG/OeUkoWhgd7vUkrU1cabkI4c4l9y/03LT5uWo6z1cSs3f
	 OZHGQmPIzn6C2UU/7HtEQmae8Xv3j4mYVrrjA9zOtB9XfzQ8701DObuO4OrajuoIYYgtj
	 wmgEt09gVvaao+jWZ5AK1/Yf0ulsxh9gteTW+N8Jb4suPZeyDuG4l2NLE9RW417uv2IlF
	 H/T6W9MckjBItYzDZSyIkEMLIgqMBGcW7jnbrVIsmYouiruCp2dnb4pJPWKQg0zPOKY7f
	 E7SH9n+3UNWymwnNc8gQFQPW/WjZypPaqanhxcQZOHf6wsG1bSd//3ICqCdsnou4RKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=37mgQiNz9438H5z9ut95YSwOUtAhwCNO6PLmiXl01Zk=;
	b=ziLRbzwEvJ1WoclrXE0dRgToCjgpI36FKXFAeN84XaxYN70YLuq4iPbMAw0sj884cDhV
	 pXYfUP889AAaz2gsN7YMukg8ujp7sc3W5TbmIT+TGpzZ8c7+y5BW6AnPPuDzOOWqLaGKn
	 FBZhT5DgXvAUIF8TpI3sfclZfl0qUc+5SPJSuqf5E04+/JcJUs4dKMO5VsPyxgos+EWG5
	 MohK2Fr69bTohMJLjvaEHBuKURWFah2XPI783lSqQ9m1wlwZPI1OOn884so/Dw89/GGyy
	 NKlYmrzDhOD2NzR9XJ+naa7lQag1ntCdD0ESgyYC9qar7RFUd/PSWz4TK7sQeYCHGvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O4wXwqCt;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E449606A33A
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 14:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E449606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O4wXwqCt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795099384; x=1826635384;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=5jTUDFydS283sFxgbjqdc9FtQ4ccCG7mR8JP+Fu2WlE=;
  b=O4wXwqCtAy2e3BGzWOOzdiuH+d2sKZ18KG2KfzoCL+HvtmevSUvSpJtf
   2Ry4eykfjIqKqW2khtgDwAgEGjt+LKeILYnBsrQxs9gSHthVI5hltUn2C
   Quh8Ipuus3EzG0TiS9stoYl0aB72FAgw3wuCA+RoBWEtQfeaBtf3jWu4Z
   OXaKoeLsuYe9r3pcGLYiVR8Jo5gPzsuP3vWzPET+TpOYOwMNjJbbWeWZZ
   reQrZwiaznXKaq6OXPo+/mGQOoK2ISIvoU0mHNhnyIoGat1fwZX7eJZzj
   Rql5U9iRXc+7nrWG0dMqDJAKrLQq8VacDKMYlxB+ZDpz7mSTjFTf3fIeJ
   g==;
X-CSE-ConnectionGUID: Vj4vd/shR8SXxw3+J3zbkg==
X-CSE-MsgGUID: NRxc5v6dSkuEjBuJ+I/Grw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849605"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:43:04 -0800
X-CSE-ConnectionGUID: 4KNjQFUySKK7HdFURLFXNg==
X-CSE-MsgGUID: 7vYDZkMwRv6sH+4fZHmg8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10786397"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:42:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261116-superm1-linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48-v1-1-d16f095d56b0@amd.com>
References: <20261116-superm1-linux-30bea57c-97e7-4889-8d3b-f6e37b4ccc48-v1-1-d16f095d56b0@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hfi: Reject zero workload classes at
 probe
Message-Id: <179509937100.9442.12000334511917261789.b4-ty@b4>
Date: Thu, 19 Nov 2026 16:42:51 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

On Mon, 16 Nov 2026 21:09:52 -0600, Mario Limonciello wrote:

> amd_hfi_alloc_class_data() reads the number of workload classes from
> CPUID and only rejects values above 255. If the CPUID leaf reports 0,
> devm_kzalloc_objs() returns ZERO_SIZE_PTR (non-NULL), so probe carries on.
> amd_set_hfi_ipcc_score() then skips its loop but unconditionally reads
> ipcc_scores[0], dereferencing ZERO_SIZE_PTR and faulting.
> 
> A device with no workload classes has nothing for the driver to do, so
> fail probe with -EINVAL when the count is zero.
> 
> [...]

Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

FYI [if applicable to your patch], as per Linus' policy change, also
fixes are mostly routed through for-next unless the fix is for a
commit introduced in the most recent cycle or is clearly a regression
fix.

The list of commits applied:
[1/1] platform/x86/amd/hfi: Reject zero workload classes at probe
      commit: cc0aef5e88572e00dba662b6ae2a4e52b0860d9b

--
 i.

