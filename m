Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167953;
	b=MZFBQ/1Ibbxl05/jW5wfbsyLultyuMyayX3BxNkudDs2UX1rMJe4RxK49VTIZVamdKO/
	 ozmVcIrXDEJkH29aB9gCngViaIOYnButjiMu2SBf94DJumKbCBlHbf7ZEDECsSgiToKbk
	 kEXYAnIiOQer9sIqghUF9F62XgU23JFEB5rbK+G4rLdadDLEoVRBzcqB5kuhH8ZIvoIfh
	 ss/KdhyS5VUHuWux3kZvbsPJNbPDJm+O4DJmEwmZNRIvk57QWvG2aUcJSmgmkRsai+fqX
	 xaDjTDVanf2P0MMtH0OeHEL5CIBtT2SIDSC4SVbqO/bgKByrC5Z4mjMExmXsD/jGjpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=JFHD9SkIi5VJCArvPWS4nRA3Es9mY7tuwEEoOHhS0oI=;
	b=C2UQ2f8fMcrD2Iwe48mX4blREhROEzbq5akZA/1qdrAZ+WE8HwSCQXlq3VmXyNKKsFIs
	 wxgqLRUIMt1gASq2LsZsGXiSG6m+fCsAsFFOQoWIrD53MIgrrOipZI6NcB5uJw/IfrRr9
	 OzudnV5nCDTO2cE9JciFC9KJxvFYEl03GOOd9d2cQ3RkGag+4iZWDUX9oNSoHFSPrucCS
	 OPwHZ+Ul4lmOXpqHMCCpjcXr/MWeNIWAIQnj1+2oDPU83syGpuaKD7TS6jdLCyWDr6Gge
	 xKL8/dkBdvse6c/kzyhgcxKCxtPtCAD11lg1J1JVx8413WSzosUQi3BZEdu7SZDxSMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TiU2rgDw;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2789606A320;
	Fri, 20 Nov 2026 09:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2789606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TiU2rgDw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795167953; x=1826703953;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=OIrT2TMMhf91zdOdYOZljSEXIwMa0ETIGVelH2cE1GI=;
  b=TiU2rgDwOiEcLB1H7PpzbGNmgmz6vnjtdXqv9cvy7K/Qo7zfaHQtwfQ7
   L33zXGIKFyCB9wsKf/zyP2+hdd3FC5vT0oH4Ms2OrHoQ0VEupWdcPjJpE
   ebSIJuEdFYSgfOoDCfTBNTg+Hb+xL0WjzrG3hjGxBRq2jrJ87HWVXmMi+
   KVp0lWjTLoEd1QI1YNV9MlxSop3zuhEWBR2ow1IRS1MqJAZ5g4Y3wwYzL
   6TU0pNN6K2BDPoffYtYC1J2WGEh/vtSyFwNDvIQ78fRc3P+9FOZszhoYr
   o06PHUqNtQLIOD8AFQAmA4rPsfc+/JVWM/KWHksEquKELSdjpv8yx2qQR
   g==;
X-CSE-ConnectionGUID: YHMg46WDS5au2I1LAWu8JQ==
X-CSE-MsgGUID: 6ylut2zRSwaYXNemavWZTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3929156"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3929156"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:45:52 -0800
X-CSE-ConnectionGUID: 1DUkpQpXQbGOLY3N7Ta/jw==
X-CSE-MsgGUID: HBxS0tTpTAaTDeCAo4yLSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10953396"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 01:45:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 20 Nov 2026 11:45:46 +0200 (EET)
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
    Dell.Client.Kernel@dell.com, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] tools/wmi: Check the Dell SMBIOS buffer size read
In-Reply-To: <20261120061927.98196-1-zhujun2@cmss.chinamobile.com>
Message-ID: <3cbdaae9-d586-ceb3-e035-5f734080b0a9@linux.intel.com>
References: <20261120061927.98196-1-zhujun2@cmss.chinamobile.com>
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

In Fri, 20 Nov 2026, Zhu Jun wrote:

> query_buffer_size() ignores an incomplete read, and main() can use a
> partial size or reach free() before buffer has been initialized.

Huh?

free() doesn't care whether buffer is initialized or not, as long as it's 
allocated?!?

> Require a complete size read and return failure before allocating or
> freeing a buffer when the size is unavailable.
> 
> Fixes: 9d64fc08f6fe ("tools/wmi: add a sample for dell smbios communication over WMI")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  tools/wmi/dell-smbios-example.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
> index 1f3e7ab14b68..a4c63a6a0ee3 100644
> --- a/tools/wmi/dell-smbios-example.c
> +++ b/tools/wmi/dell-smbios-example.c
> @@ -143,13 +143,15 @@ static int activate_token(struct dell_wmi_smbios_buffer *buffer,
>  static int query_buffer_size(__u64 *buffer_size)
>  {
>  	FILE *f;
> +	int ret;
>  
>  	f = fopen(ioctl_devfs, "rb");
>  	if (!f)
> -		return -EINVAL;
> -	fread(buffer_size, sizeof(__u64), 1, f);
> +		return -errno;

Look unreleated change to me.

Please make a proper series, with minimal, logical change done in each 
patch instead.

> +	ret = fread(buffer_size, sizeof(*buffer_size), 1, f) == 1 ? 0 : -EIO;

Could we like write this so it follows the normal style.

>  	fclose(f);
> -	return EXIT_SUCCESS;
> +
> +	return ret;
>  }
>  
>  int main(void)
> @@ -159,9 +161,9 @@ int main(void)
>  	__u64 value = 0;
>  
>  	ret = query_buffer_size(&value);
> -	if (ret == EXIT_FAILURE || !value) {
> +	if (ret || !value) {
>  		printf("Unable to read buffer size\n");
> -		goto out;
> +		return EXIT_FAILURE;

So this longer frees the buffer?

>  	}
>  	printf("Detected required buffer size %lld\n", value);
>  
> 
> 

-- 
 i.

