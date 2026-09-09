Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F19E30BF70;
	Wed,  9 Sep 2026 20:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788987215; cv=pass; b=okAx9WaFZsdEzqFKBk/unPLQHmlQA4YDzC1rmWPj5N5aEX6XxrEI/XUEM8/91OaKQd8ybLQMhRUbQ6k3DlfE7yqlnZLVjFQY97IrI60kPXIWmjDJAbMniF6v2UWAfyLYYOSGw9iJGd95zeAJ7ZbWtEm11cm5DCpp/wyBKNOFbjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788987215; c=relaxed/simple;
	bh=MX2e2/HgyLygQhDM0hc3srItVhaz8oAVzN4D3harGd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DueTcLGzt3umQrX0RUOBloZksUrx+rDvmclk3w0X6tW8HB5co5HhlsHy3BYAA6mP5Mk7EZ8s1Ube5GHCOQH2hwJ3AcyO2mDZArp7QBNZFuUzi/VhtC/c1GkNHJUtqo8jjja4Hq49bAaYly8VShTjWQURORFRhoSFm2KLNaZdVE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=EDqY2cs3; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="EDqY2cs3"
ARC-Seal: i=1; a=rsa-sha256; t=1788987200; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RKIjUKiJIejspHCS4yqIjf0/6F9TfAVjZDcwKY4TlEGh20pS2swSJI5c2kxy6pmYaxof0zzlS2+KAWh0x8wydylQxuOhQZX6+13rLo9Vo/V9uXyHq7HgSLofyIkC/+Mci/dh1Lzze2P5o7waP4DR+V7qCfVHAnSKJNzgFZPxrK4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788987200; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=36Oekg4muNXL3IagnuNjOVkovenYtmvsRgrwI+sECvA=; 
	b=VKQz1ifRyXML6aENXTJqVOyKD2b/t9sw7ayUn2J4rvLWVoXk1UGN7XE1IeGTxwwUsDuU3SJZhsnsXe0p3+LthNnv4HJNcTddug5DS8tpO9wYyYCdjXnSZeI9Z6wlLg0yc5AN6O6WO69PkAAVL+CQl/mr7AEty2UJfR1IuHtDm/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788987200;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=36Oekg4muNXL3IagnuNjOVkovenYtmvsRgrwI+sECvA=;
	b=EDqY2cs3HSPok1Fr5ydk2HlMfYxE22MsqRHaQsilnxa82niyvtknzByJ6NrjL4m5
	2pJBLIzu4ZZodq9GFMFKL6OPOT4DhdDo+BdMQLQEqxXbgO3+GwTsxpuVTHKnKrJb8+c
	GTN332/yq8cbiH4Df9ljHqI343tqyj45awlsk3Ws=
Received: by mx.zohomail.com with SMTPS id 178898719804411.128739490646694;
	Wed, 9 Sep 2026 13:53:18 -0700 (PDT)
Date: Thu, 10 Sep 2026 00:23:06 +0330
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	"Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] platform/x86: acer-wmi: enable hwmon on Aspire
 A315-58G
Message-ID: <rg6elsf5yqgadfbofwwmouw63tcftnxwksjihliorthf24zrej@nefdwhwksxjr>
References: <20260819150205.19453-1-moh53n@moh53n.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819150205.19453-1-moh53n@moh53n.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.982.46
X-ZohoMailClient: External

Hi,

Gentle ping on this series. Please let me know if any changes are needed.

Thanks,
Mohsen

On 2026-08-19 18:31, Mohsen Tahmasebi wrote:
> Some Acer laptops expose the same WMI sensor interface without necessarily
> supporting platform profile functionality.
> 
> This series cleans up the quirk fields by using bool, separates hwmon from
> platform profile support, renames the predator_v4 quirk field to
> platform_profile, and enables hwmon support on the Acer Aspire A315-58G.
> 
> Changes in v2:
> - Use bool for boolean quirk fields, as suggested.
> - Completely split hwmon from the predator_v4 quirk field.
> - Rename the predator_v4 quirk field to platform_profile, as suggested.
> - Enable hwmon for existing Predator-v4 quirk entries.
> 
> Link to v1: https://lore.kernel.org/platform-driver-x86/20260813154939.9850-1-moh53n@moh53n.net/
> 
> 
> Mohsen Tahmasebi (3):
>   platform/x86: acer-wmi: use bool for boolean quirk fields
>   platform/x86: acer-wmi: split hwmon from platform profile quirk
>   platform/x86: acer-wmi: enable hwmon on Aspire A315-58G
> 
>  drivers/platform/x86/acer-wmi.c | 56 ++++++++++++++++++++++-----------
>  1 file changed, 38 insertions(+), 18 deletions(-)
> 
> 
> base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
> -- 
> 2.54.0
> 
