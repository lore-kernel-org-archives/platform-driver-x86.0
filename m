Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRpBkQa9"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F75171D;
	Fri,  8 Dec 2023 03:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702034682; x=1733570682;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=J7RKyZr5ol9duGiT81gLM1o4OL83UMlZmqvS+FpSDW0=;
  b=CRpBkQa9doG6NghHL3Ve0bvkxxyGzfPqqyXBRm/c1wEU9COHNzyTKsfK
   0VCu1zpPB/mFTnUpMuGZeELd8RfHDl8O+neva+Wwg+qRYm7dqDobD6CeO
   DjByED+psYEg5bhDhckOHon8nTtRw36yMi5xq4E8hsU3U+tdPNT2l5PGM
   dk5OLBQsuzwwhuikZWZe29QAi7Qrx6efxmVbJF0orIQPjux+p61+keSCN
   KmrB2ShOG2YzLaRAkU3MTCDjM16wViHue4E3MPEt6aOQBygjJoo/gG8Wl
   8dR/GxC85SYF30/g5ndHFQO99B5TXXedrnr8xXtn0KhihPqVPVcARdpss
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480588888"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="480588888"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:24:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772099007"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="772099007"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.49.180])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:24:39 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20231206060120.4816-1-rdunlap@infradead.org>
References: <20231206060120.4816-1-rdunlap@infradead.org>
Subject: Re: [PATCH] platform/x86: intel_ips: fix kernel-doc formatting
Message-Id: <170203467391.2381.1940561088984223400.b4-ty@linux.intel.com>
Date: Fri, 08 Dec 2023 13:24:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Tue, 05 Dec 2023 22:01:18 -0800, Randy Dunlap wrote:

> Fix kernel-doc function notation and comment formatting to prevent
> warnings from scripts/kernel-doc.
> 
> for drivers/platform/x86/intel_ips.c:
> 595: warning: No description found for return value of 'mcp_exceeded'
> 624: warning: No description found for return value of 'cpu_exceeded'
> 650: warning: No description found for return value of 'mch_exceeded'
> 745: warning: bad line:                 cpu+ gpu+       cpu+gpu-        cpu-gpu+        cpu-gpu-
> 746: warning: bad line: cpu < gpu <     cpu+gpu+        cpu+            gpu+            nothing
> 753: warning: No description found for return value of 'ips_adjust'
> 747: warning: bad line: cpu < gpu >=    cpu+gpu-(mcp<)  cpu+gpu-(mcp<)  gpu-            gpu-
> 748: warning: bad line: cpu >= gpu <    cpu-gpu+(mcp<)  cpu-            cpu-gpu+(mcp<)  cpu-
> 749: warning: bad line: cpu >= gpu >=   cpu-gpu-        cpu-gpu-        cpu-gpu-        cpu-gpu-
> 945: warning: No description found for return value of 'ips_monitor'
> 1151: warning: No description found for return value of 'ips_irq_handler'
> 1301: warning: Function parameter or member 'ips' not described in 'ips_detect_cpu'
> 1302: warning: No description found for return value of 'ips_detect_cpu'
> 1358: warning: No description found for return value of 'ips_get_i915_syms'
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: intel_ips: fix kernel-doc formatting
      commit: 7bcd032370f88fd4022b6926d101403e96a86309

--
 i.

