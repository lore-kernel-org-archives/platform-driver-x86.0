Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1991D318EE7
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Aug 2026 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787263824; cv=pass; b=tdr8RZw5pEZQPsmvWsq6Vw+9Ca7rm6WB+1mnD3KfuvRsx+mu7EYWiLUtipW0/r/2VvKdNm4xFuzQwrxb0Yfms3SHFN8InW3+YjrqpQgvJldm5vfUCOCPyc1c6A39RRoS5HTJQsb4EfpaMjCc2XVnO20sQIiBbwtuoYU4AdNdoNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787263824; c=relaxed/simple;
	bh=OouqVlEmTiWxYhNTfqjqiWUBwBBzwGiV/v0w3r9eTGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMmawc2ykYTIITJkH4iutGU3TpBkg5s5pOFn+SyOYseTYg+s0R7p9ViMZAE+As1O2VAkyj5eeNwwXk5v2aTQ59zgmdopgUp0f0E3NYABy21+5vj3oQz3NqS21Zqi53PyNhe7WZKWdV2l0om/qJvBIOA6HcdCSKOp5blhovVm0SQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=mFkudQ8G; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="mFkudQ8G"
ARC-Seal: i=1; a=rsa-sha256; t=1787263814; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GCC4KzbzxgfMr9syhGB5nz/Zn7fJfvItYel7LU/M1y+IwestXudsBPP+gR2IAsCchvE6enOpXKM/EryG1w8tF0yx252NA41gwh3J61d44wDC7vbsrCqhlX+4e9IyduZCzc3nSb4ACPj3arXl7zLst9lvshYy5xJu5aP9cwh1iIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787263814; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OouqVlEmTiWxYhNTfqjqiWUBwBBzwGiV/v0w3r9eTGI=; 
	b=CXOcAKsigXvKxoFebyqDM0VJPkEs7J8CH/gL3W0SQRTbYEHGMppSupCMUaAkDjlhvVhYjBLTNHTNsKCNmi0cVOkt6dLwMdORc4JP6zb8O6RWw1ovk/+yEbFFcmJGWuOPvrDHhTmwbyNTbbJWz2jbd42KuAhI7ETR2RoWqcC7E8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787263814;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=OouqVlEmTiWxYhNTfqjqiWUBwBBzwGiV/v0w3r9eTGI=;
	b=mFkudQ8GyyaT8ecup//GTrUvUuOCIU1Ofl6fWNOBaLGm6SNowyixgariN0glYkYT
	LHJn7EPfok/mMo4uxXXjv447dKAq3Rnfaxd/CqfdVHuzBLnXyxixs67g8QAqW2x/LmI
	KoDSF1J0+Yc4pRCxHDJAA3cONgpjf+T9P/Asnf8s=
Received: by mx.zohomail.com with SMTPS id 1787263810979196.01955481807715;
	Thu, 20 Aug 2026 15:10:10 -0700 (PDT)
Date: Fri, 21 Aug 2026 01:40:06 +0330
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: Jelle van der Waa <jelle@vdwaa.nl>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	Frederik Harwath <frederik@harwath.name>
Subject: Re: [PATCH v6 1/1] platform/x86: add Acer battery control driver
Message-ID: <sna7wvf6wina7hpj7okaxhof25gakk5ywzusbhm4iwb32fej3f@ltolrxw4zdrq>
References: <20260812192319.276246-1-jelle@vdwaa.nl>
 <20260812192319.276246-2-jelle@vdwaa.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812192319.276246-2-jelle@vdwaa.nl>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/287.245.6
X-ZohoMailClient: External

Hi Jelle,

I tested v6 on an Acer Aspire A315-58G, BIOS V1.35, kernel 7.2.0 + this patch.

Since A315-58G is not in acer_wmi_battery_health_mode_table, I tested the
battery health mode with force=1.

The battery WMI GUID is present and all of tests worked with no errors:

- battery temperature is reported correctly
- charge_type mode switch works
- charging stops at 80% with Long_Life enabled
- charging continues beyond 80% after switching back to Standard
- the setting survives AC unplug/replug and reboot
- no warnings or errors in dmesg

$ cat /sys/class/dmi/id/sys_vendor
Acer

$ cat /sys/class/dmi/id/product_name
Aspire A315-58G

Tested-by: Mohsen Tahmasebi <moh53n@moh53n.net>
