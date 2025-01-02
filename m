Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F97613AA2A;
	Thu,  2 Jan 2025 21:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853766; cv=none; b=WeoRUpiCoL4PLjVFpwVcRrX6xnw1oa79esuiAX+XU2lSH3pP94r//zyufXm7QIb27fS/EEjRWN9O0OTCAYWkqlxZTLKFdvgwbnlHIgt7+SYR1chudfkYfINEBZF9cvD6u3VohuVh7jdFc842Yy0Dr8JpdEQ8UsOfVnzfiMmnglU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853766; c=relaxed/simple;
	bh=Q+5DHeq0cvPFZenOgFwusv6M5ATeJqY2cP/UTMsUjzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjM4AuR9hqiAqgWCmpYfcUOtHKicUeML7BisLH7tJnu3hN5CuBvHz9dWatrLfHcHhQR9ZDNOhD5KZkP55nc3Wtls8TWda/3SAZFj/5Q91QF2hH3wdpDjzvj9HV1H2qFDrbESahYtggrFRxOHdrpZ0cWTuyRDPcbRHx0pN3nQtd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TycYPCJ1; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TycYPCJ1"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f4cc48ab37so3218884eaf.1;
        Thu, 02 Jan 2025 13:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735853763; x=1736458563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzJDo24sgMj2v2mw0oza4DL+2P0aGRb++ESw4p7vNCA=;
        b=TycYPCJ1sqf8pUMKH5xTyXS39zbLhomtdg+8rrZuJlufd8AVELt3AdnpkcaYEb8Kyw
         AnAOSETRlI/16fVQQAys4Woky06Q6FI4mHnkvUUmFYM06wxUnHNT3inbhhs0tIu0H0Ng
         YLR5wJwLvfLCWPqjXKqrwMK+6yIqd9JxHOCB+Xld/gGA6jp/lbxnM7HibgiwYkYaIcjR
         F8mhx7NNHL91yNxW2SGwy/nVxcwAAHDtq8T4ilRp0Z2GOT2j9jgA/wE6ieNKAmL7+Kpd
         LUQ9oueTfrhdnMDWXOwUh9ZrPgf7FSAPYj39Pr+7XUklwbY1R0VpdWkCQ+R/xNvdtLXG
         G3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853763; x=1736458563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzJDo24sgMj2v2mw0oza4DL+2P0aGRb++ESw4p7vNCA=;
        b=ksKfiBg15IDZwsLOHxndhblEuVe7G/vfh9vKUZWpiRjREe5S+042evRay8X/dNtmmC
         d5L8fjXRss3pYKhY5Wm4bI1l9SWbg56+273LX8TOJjcN/p0iXp60IHBJ1VtEMBY2Isj2
         u5g2RD7x1t8GfNy1w9eFXOcPx0TL3K9q3z7xch7yBUrMlJIkisfSKA3ITkU5pIpR22pO
         wQORb9cvDvV1ACP23ddhwrD2SY+vMrAABn8d54OKZjwJ2z4uomp369/iNtvuj4tQ+SMM
         kWP4roGbnmtVxoavCUEQXtkQUV4CeeHbks96iBioMwtt7F1uwZR/BigjJUpOSYRqRfvI
         uhJw==
X-Forwarded-Encrypted: i=1; AJvYcCVhs06behrqTZcslgFZcu+b74Og0HtKpk6TtqJzwDS134pC7erg1gayneBcyaLvqCtp6vnfgRxYk3y2SGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNf8Ykjn9Db5Fm7BSXLfUsZWSBusaFY3OEl2TTinJNseQXQ48M
	q43PjSsCDCuBrwbsutnRl6+zTSykrxjatJ7cL5aqBkFN8UTKD+zMJ7Wgdg==
X-Gm-Gg: ASbGnctkX6Mfj3/6FhW+vJkS5qebgTvpWN9EWMUmnHZI56zzoZJNIjXA+dnszSgRLm2
	RlTE5A7F5ocH4GN3fVVwXCF5YwrmBBzxFgD2U2dKHYpWfyxm5nJSWALrSl4a9X6Hi8fkqkkxhfD
	yFfha5WXyIab1gjW9gLkbAGpGuWfZj08kiwSwIyEXf9ZzPkC3cnn1g54bx1BfgQIqwD52PDBM1C
	PggoLenlFs/zsDQ3tzyEjIiRcboTrRXaftRu8edy9WsByB+HMX5CmqgFREdeseckuvepTjTCMog
	yjIJEFvSYjNTpXZeifl2q9e4rG0qt6mbuKcQiBFh315V
X-Google-Smtp-Source: AGHT+IF2i+aINp/L+PtwlTDomu7HaA2+6dZRajIokcmV1SrX/qzrkfx6KB4nxKMbFE1knjMQ3LPKrQ==
X-Received: by 2002:a05:6820:1997:b0:5f6:7cc3:873f with SMTP id 006d021491bc7-5f67cc388fbmr15074883eaf.3.1735853763399;
        Thu, 02 Jan 2025 13:36:03 -0800 (PST)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f4db74b4a4sm7330887eaf.30.2025.01.02.13.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 13:36:02 -0800 (PST)
Message-ID: <ae2a0dfd-1b84-4b3d-ae25-5f1992c2a71a@gmail.com>
Date: Thu, 2 Jan 2025 15:36:01 -0600
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86/amd/hsmp: Constify 'struct
 bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, "David E. Box"
 <david.e.box@linux.intel.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-sysfs-const-bin_attr-pdx86-v1-0-9ab204c2a814@weissschuh.net>
 <20241202-sysfs-const-bin_attr-pdx86-v1-5-9ab204c2a814@weissschuh.net>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20241202-sysfs-const-bin_attr-pdx86-v1-5-9ab204c2a814@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/2/24 13:38, Thomas Weißschuh wrote:

> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
>
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 12 ++++++------
>  drivers/platform/x86/amd/hsmp/plat.c | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index dd5b5773328a9aff376a389cbd0109cb8cf0e385..7d802bfe206c73a4570dcd3752faee853bb81485 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -226,7 +226,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  }
>  
>  static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> -					 struct bin_attribute *bin_attr, char *buf,
> +					 const struct bin_attribute *bin_attr, char *buf,
>  					 loff_t off, size_t count)
>  {
>  	struct device *dev = container_of(kobj, struct device, kobj);
> @@ -285,19 +285,19 @@ static int init_acpi(struct device *dev)
>  	return ret;
>  }
>  
> -static struct bin_attribute  hsmp_metric_tbl_attr = {
> +static const struct bin_attribute  hsmp_metric_tbl_attr = {
>  	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> -	.read = hsmp_metric_tbl_acpi_read,
> +	.read_new = hsmp_metric_tbl_acpi_read,
>  	.size = sizeof(struct hsmp_metric_table),
>  };
>  
> -static struct bin_attribute *hsmp_attr_list[] = {
> +static const struct bin_attribute *hsmp_attr_list[] = {
>  	&hsmp_metric_tbl_attr,
>  	NULL
>  };
>  
> -static struct attribute_group hsmp_attr_grp = {
> -	.bin_attrs = hsmp_attr_list,
> +static const struct attribute_group hsmp_attr_grp = {
> +	.bin_attrs_new = hsmp_attr_list,
>  	.is_bin_visible = hsmp_is_sock_attr_visible,
>  };
>  
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 748bbc35648474370275a80daf2c26e5d732f6ad..1fdcd65d398e6ceca154b804074cbba083f4b7f1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -59,7 +59,7 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  }
>  
>  static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobject *kobj,
> -					 struct bin_attribute *bin_attr, char *buf,
> +					 const struct bin_attribute *bin_attr, char *buf,
>  					 loff_t off, size_t count)
>  {
>  	struct hsmp_socket *sock;
> @@ -97,13 +97,13 @@ static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>   * is_bin_visible function is used to show / hide the necessary groups.
>   */
>  #define HSMP_BIN_ATTR(index, _list)					\
> -static struct bin_attribute attr##index = {				\
> +static const struct bin_attribute attr##index = {			\
>  	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},	\
>  	.private = (void *)index,					\
> -	.read = hsmp_metric_tbl_plat_read,					\
> +	.read_new = hsmp_metric_tbl_plat_read,				\
>  	.size = sizeof(struct hsmp_metric_table),			\
>  };									\
> -static struct bin_attribute _list[] = {					\
> +static const struct bin_attribute _list[] = {				\
>  	&attr##index,							\
>  	NULL								\
>  }
> @@ -118,8 +118,8 @@ HSMP_BIN_ATTR(6, *sock6_attr_list);
>  HSMP_BIN_ATTR(7, *sock7_attr_list);
>  
>  #define HSMP_BIN_ATTR_GRP(index, _list, _name)			\
> -static struct attribute_group sock##index##_attr_grp = {	\
> -	.bin_attrs = _list,					\
> +static const struct attribute_group sock##index##_attr_grp = {	\
> +	.bin_attrs_new = _list,					\
>  	.is_bin_visible = hsmp_is_sock_attr_visible,		\
>  	.name = #_name,						\
>  }


Acked-by: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>


>
