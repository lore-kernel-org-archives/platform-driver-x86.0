Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB2C184F;
	Fri, 27 Dec 2024 00:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735259543; cv=none; b=cl/F618bdkSW4+2yBlhNGSwXJ8A4E2gzklUNp7JmxpMgnoG7Zk8cgGZ2ML8L1mziuQ7rkhfQlMJEW6wvVPUkHQtAFlHDPO4ID/Z93B3c51eM6daKqhl3TFgX2QFsst8lf0Lzj+Mawuo9QXmLVHnifsO1d4iVZpqJxVmngBCyhGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735259543; c=relaxed/simple;
	bh=0dOZ+QDFR5qPPaInKXToq2rHcgosB/zdJLUWN6axuzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAmQ15hHozVtU9njDe+/65dClWbyocfhENR69TDY2Q9kwksno19HkaC1neH5ZnhygxPNLH8zd7ddR+w+Mi2WuGW4Ww2Y7BR8WGyd7Soqu+Oy07pkf6E4iLW8ex3QlzqcL9jVivBi5eMbb1ykIkE9B08PBRRV3mfTvuRpmoyWeR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UM2xteCv; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UM2xteCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735259528; x=1735864328; i=w_armin@gmx.de;
	bh=zTJRdllsMhOs02XNE200pIGEg6SGhFo48t8ffP0NeFA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UM2xteCve5BFrXd4O4YRSqnUYi5+MSM5EWOTDib/ODZZKOutQXH10+v+uFp7Y35h
	 CknwKGtQF6q1o3vJn+YDh61sz6k+pLL9BrpGnCZZnG7PazyZ2+dLVhEBjCBmg7/CN
	 WaQq5iY1cX37HPZtUJpA8tdayqL5hGmZ401ir0amk8yOCbVu/XQtVap097FJDAdnm
	 7NTr9C/5VztX4iP3OHwBfms3K3JJFKr1g7yI3RIHiKVbbCvyeuAj+bA50KBUkkIRu
	 d2BhQqbIoQxklbvbO/G1oDAzx0uXGZAohI/dMqHb44CcEor9+77LEMcrgjcDK8Yt1
	 RIqYrK+9K1uTtpZj6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1tEqGK2Tqm-00BIW1; Fri, 27
 Dec 2024 01:32:08 +0100
Message-ID: <4f4ee416-8ca3-4051-afb2-13266595c3c2@gmx.de>
Date: Fri, 27 Dec 2024 01:32:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] alienware-wmi: Remove unnecessary check at module
 exit
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-2-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-2-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vPp+5RBI46/4dqQ2zyaGkPXsIy7XHJ8Lrz+e3gpR/A5Lg3LE8kK
 LD5tinMwnzcEClMgGwS9SXRbwvUS3fJIM4J/uTTRl7xApyImYZ100z3PJuh0azF9eAZBcAz
 QSy10pRMnqn6UwWD6vnDDSwEyJI0G2ltgiH/D069C+hJ2kAi0Fcfvj9m/TbdCGjglvdpOXF
 6c+Z1GKdIOAnAZXd91N3Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0zrj1ZMocUw=;FxC3Y9Brh5LHcXrQAOqZnd/28jD
 juOoUxr1tXQ45rDTgQn6EzDLA5YBUEB5HOpeMYHAa9o7gPnaLLMfYWmubEe74KZW5wSXmJmKA
 KYjDhlCFZvQLc6a9xZAHJsJLYYsQ7QVYealeSyvtXKE3OZRb2ZHFR24srunDnTMK9HHdgH2ja
 A3Uk6XJ4RlPYHt8ryMN/XhMFH0t/1r3sNrU5qCpepEWhjSAYbX2p0cknb3p7bJsiDyWvMhtw6
 mETeGJramwk/N6GOHS9RaC+FxnO3ki3agg5PFLNQktxxA+2CGy1fyVvogkVp2dqJttmHjelWz
 HQjcR0C81B8oYZuqyED7fQ3kRW6IEMH6oW6F4nQUEH/cTdihbMWRtDyrY35jYLE2DZhqCFjMO
 WDc82JjuTZn1AmvTlTBy5d2KepDC/Mwl+FKxfqWX9Ulow7ZWHYJrm0YQFKrgaRStuOqDDoRx8
 QH3X6YsNSFr8zA7dv45OPmoA20YeEwtEL4utxbZUTma7zr/TM2GCDV0Dj0eUUAAhapW468t6f
 s/dhlqRampPpMZrMlNer+djyTTbrzlBkE1zGuyLfkUP6I5CU322/4nIH68FPK6tv4wXfstTL6
 oT+pmfTbDiPbwa3gcilYV1DvkWUPPlxNVNWi0SD0+9gu8PCYVtHkjjStyH31ojNvM/M8xDs4p
 kEnUBXSKq1ZvfYlQYGZfT4Qx6r7AVxZMO0WYzcgU1kQUYSP+q1TR/7WZpGACn71FxoVDPGqcl
 PwgFiNznMHGuno3idKqucfjGyqn/xgsZcFMGOAyLsLTllcxLajMMeeUmnf29H/q/7Iw4kxb8W
 qBuzyimNknLENJiPkdoqPSLt6OEziWfJVr1c2ZIp4wUjyVpsUiwpramsJ8pwuWWCJJXGIKsAa
 thQwRZTFlsWQ+UVGHJtTXeFIT1ekV28HIAmAcjvlqH/Z7qpsgz5SzZEWDljzg33rjanYsX9o0
 CX28u4lfuX8wElvrh3O6t8GBzj1H2Ed+nn+0kOHcrJMeiKmVyCmvlbRM0hrn9E6emqNa/IeJV
 sy5wQE6uhflHQo1VrLBehsbwTCD8V/0A4E/i9MWdSoceipfiZjXT4A1nG7958BA6gz4Zwogrd
 z9RtrWr+q73kE+RTqbEfPJhNSasP54

Am 21.12.24 um 06:58 schrieb Kurt Borja:

> Module initialization fails if platform device fails to register so it's
> always not NULL at exit.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index e95d22c7b60c..ed66720260ab 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -1257,13 +1257,11 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	if (platform_device) {
> -		alienware_zone_exit(platform_device);
> -		remove_hdmi(platform_device);
> -		remove_thermal_profile();
> -		platform_device_unregister(platform_device);
> -		platform_driver_unregister(&platform_driver);
> -	}
> +	alienware_zone_exit(platform_device);
> +	remove_hdmi(platform_device);
> +	remove_thermal_profile();
> +	platform_device_unregister(platform_device);
> +	platform_driver_unregister(&platform_driver);
>   }
>
>   module_exit(alienware_wmi_exit);
