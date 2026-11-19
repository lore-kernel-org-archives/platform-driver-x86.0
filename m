Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795104192;
	b=y2F9NKtXW7umAl9+5eMwpz1TLi0g1vkjdnve8qJrJpeU19OPiMouIvKM3Wh78PuJO4Ov
	 fJvpG9CKk1SgmCnBmQy+rWmI1RpAxtbSvUOdwf0C6fu38rKt7vNwjU2MgqlsuI+9mDD+W
	 bn1a6Mdk/MCQ7T6bpxK+ocYSrEk4wY85YHeCZsDMjgCelZb8sHs54GFUBKH0sD3YstrKd
	 kJ0T610eGA0j6msGWy1q0MPZvV956dEAHiZZ8xQURx62RuTbV/cC5KuDNyqnPQX4HQ+Fr
	 3HES+D5/uKupjBxoCVCKE0mMdDWw9KYSQNXrnT7tUV6TMLCsSv5ycDnULTSPetFfx5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104192;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=hhOOBMXr5wtj46XQR4Zg1xmlLi9F4CT0RmWwx/avMSs=;
	b=47uFTgwdS2d1ES9pQJsORqIZczLPR6LOF0/YHKuOrV6mato1NjzWbb8gT4MQ4bOtuup/
	 8JDBTWR35mBHXv9TKpNOccpzyhjD3dydC2RWC8Emr7LJkQ6aJyl3DdMG2Qs4rbc3Aw39G
	 odUanQcnUCdfOn03TLNnjDv7xGLIYXGybCcFx8Oq+TIZUHXvMJKhHSNmGd8YXbiwkSXan
	 J8ZcNzZ5EQ/pVNBY2I3LVs7htTDitxnbjvCb++S2mHKcrc/4sWpD5H4Nyn5RLEEd4my37
	 AgFm1KFPMpUuzmz5vnR/0g128iBuDTylWcBhevG1ErCqL3eR0CWeE5a7CW3gN5DJPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7sSYhfc;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92B560A260B;
	Thu, 19 Nov 2026 16:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C92B560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m7sSYhfc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795104192; x=1826640192;
  h=from:to:in-reply-to:references:subject:message-id:date:
   mime-version:content-transfer-encoding;
  bh=RSikVu+3rSFNr00EL4rtFc6YziDlGRNiW6MKNpXQk7w=;
  b=m7sSYhfcg/yB5lkSUP00kE1OstU1Q3cU8mj2pEoap6TqBV7ekgnjIqLC
   NXtC86cv8Knijhpcd/7lXHpRh1Lv4bKwRKgFUTVgXQlO6OB/QHZf84uIN
   SBSYEU1Ys3fQDWa7WoGk53aHkgseyZkE/KnrDfxEuhy5yJSwDWKeXy8tr
   e0K8+4ZeSRnv2WE2guS4bwLR3d7rYVBsKBxN47FpluQdP3U6f5XWDzQ/i
   u2lJpBW6UTJDk570NeXRVYZdmz4YQosqnWRsTLVtAgRA9lGAJ9JRKjFik
   pFiUK08U35+DZEXUMcAfT2CDDrJOJj1Zq9JoRvMreeTuBWtX5SsPYPRDt
   A==;
X-CSE-ConnectionGUID: Rj4vlikeQoegCtj+Zun72Q==
X-CSE-MsgGUID: cL4fheZuS66uQQPRvXKsVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3951262"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3951262"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:03:03 -0800
X-CSE-ConnectionGUID: 5Set2TcLT3qmdltsVBv73w==
X-CSE-MsgGUID: CtmhTDOCSAO1LQMSmttYTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10459492"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 08:02:59 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: prasanth.ksr@dell.com, hansg@kernel.org, Dell.Client.Kernel@dell.com, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ava <ava@oven.ninja>
In-Reply-To: <20261024103604.319624-1-ava@oven.ninja>
References: <20261024103604.319624-1-ava@oven.ninja>
Subject: Re: [PATCH] platform/x86: dell-wmi-sysman: replace deprecated
 strlcpy with strscpy
Message-Id: <179510417381.21358.12284492079106710215.b4-ty@b4>
Date: Thu, 19 Nov 2026 18:02:53 +0200
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

On Sat, 24 Oct 2026 21:36:03 +1100, Ava wrote:

> The kernel has deprecated the use of strlcpy wrappers in favor of
> the safer strscpy variants. Replace the internal driver helper
> function strlcpy_attr() with strscpy_attr() across all
> dell-wmi-sysman attribute parser files.
> 
> Ensure explicit destination buffer sizes are passed using sizeof()
> to prevent potential out-of-bounds array writes during ACPI object
> evaluations.
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
[1/1] platform/x86: dell-wmi-sysman: replace deprecated strlcpy with strscpy
      commit: a2b19337b0da259ba22226440eaa56518ae0571d

--
 i.

