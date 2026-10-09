Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD4C390CA9
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 20:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577541; cv=none; b=qCaanGdWKplv/ZbaUYVtQ/5nAKoEZlPqZokKXVzzOmiapfKiq85b/oyrDCE8BZyUWN1QstVXyzlkOWXL+CmP7xdNZJbaApIN0vwVtRwAnjVoXigs35ztlhMsxiVVqM9ZAlQQPl3nlEINkDoxBfAcu0mK/bQkERflACRoTNI9nQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577541; c=relaxed/simple;
	bh=pyZGWLbUdbVR2ht18OwxVBiajTp//ZQyF5wG0u8aP9s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZQiEuj+cxibnat10lZOUofoj9Jr6AZU9GFdHLgrXcHf9TwI3OBZju4PMdEyMQWdnQuY3nXFCU7Wu6fu433XuoPGocphIY9kvte8b3IMdVvH55t3HD5tDch/oHeOe3WWX1FXgORjXSk/5dxDV7oJ8sYtlnqRBkJleRIZIPd0ul24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DWNcu7S0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QHqyNlIr; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DWNcu7S0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QHqyNlIr"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A70541400137
	for <platform-driver-x86@vger.kernel.org>; Fri,  9 Oct 2026 16:25:38 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 16:25:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791577537;
	 x=1791663937; bh=MwXmjyG6hRITZ61KJobCPIhvxONJ3FrG39gFZFih0M8=; b=
	DWNcu7S0/PU3Z7SyXwhl/1L37OZ+Df1VR8hjeUp1EL5DR3KqwcPniy/CsVMIq9Ks
	xgBZeh6zq7w0/SXsm0fo9eNnHxLW5pDV1U5MSpOJNKvguqD575y5BqyzAcrLwWdz
	pfB5e5SiKGvcar78HdNzlwvBzVyBgYHhPaqrE8lYe42fu+q9MlugS2nvdZsHqwQZ
	TBkHceO/duB3ADYblJO17vObsJZuRvRckLulWxz4vRTWXHAbngwqsmo/FP1l7IOs
	eD8tVK/F7p8WPlQGfRLCpfKgGU9hQ7zz0kuAgXWFV4siazYj8Q1Fj9Iv+W2XnNQ2
	NjK7hLAQxHmzuGpN8CRrOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791577537; x=
	1791663937; bh=MwXmjyG6hRITZ61KJobCPIhvxONJ3FrG39gFZFih0M8=; b=Q
	HqyNlIr4QQtk2qIT8HDN5BnCemBsQ+P/wZl7dLPdcl9Ge8EQzbXWrZusvhe/VjvN
	n5ieC3uA8pu+AAlS/PpIAKQf5bqjoSDCLiLhu5/9IYkPdAwnACLni+Q1ZVuV3RN9
	Q4+xa+80uO7lEaoIEQTl4nAGF+KDadNF/EKfVR5+9ytgWdXgpDoOzyaseUAeiF97
	KyQdLj+cSl/zPOKMK559QMN0C0niWLUrWyQN+FUctCG8GpZ2CCQOwXawl6vCdIXJ
	KA4cyAOTuWcQrj/X1L21jRNFKVOSgoAaKXiWLtFlbKNVCKQ3hZPy8ZmsyC2ekSw4
	KioqY3flB8G9ufn78Ekag==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791577537; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:oxUp0OQYo2b4DXFCSjBEJ7sciD/zvdT9gfgXCQeSbe4UxIZ
	8kxwWqeislONjz8uhVGIvqLivnO0tSbq98lpEyEgutYpNnR6fa8qE06IujFvpeZd
	B91nmXeKxaipkFjY+tBhvctxKH5Wp77RHfMCq/Oe1DkZyyHvVSX2VPl3KArtoA0q
	81I20ZwWA6Dc2N1eh8wgoWYb1mtDTN8n3w61fr+IeJIeqddQ/354SYUbVg4s/x5B
	Hy23DldQoPGwP4jwRROxcd9QwXN/ypDaYPOOL24s9ieF7IY+mkE/BT0UIoTmEZuJ
	sK0UdDUgPdaFTQfQtT9MEuDce4RXWObk6buYe9g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vKUq455LbtqODxQUr6X/Dw+P7pAsK/X+5c48dEIud5E=:pyZGWLbUdbVR2ht18OwxVBiajTp//ZQyF5wG0u8aP9s=;
X-ME-Sender: <xms:wE3Jat67A637LAG6NIk-cy3Pr7RProTAIdZQoJFUW21QEDuP5EChaQ>
    <xme:wE3JaltFl5U-9KJrr3SWK5zNOQAUakL9g9rV7T8sII-yVheg1rQ7EW0tg-zyfYoPb
    EA25kCy7eN37UrvhsXHV7b-q_EDNzJhZ8zc_Cjgu0gHE58sZEwa8ZSZ>
X-ME-Proxy-Cause: dmFkZTG3xn7Bbw9gWv5qgurvEjspxkSn4pWk4BdPnBzGnSzq+aSsD4pd7LbLOs4B/V+k2K
    c3x6Sq4ftLsXtd32AsCMkXakKdY6BUFhwIi/8r6w0qXMxxwu7XIg1f/q6vOryJYhbERXxY
    FzLSiBuPnBmsTlXmv2koM0aamt2KvB0XgtlS7rWpEHyKqry++PkTofa/iLmvj8TzGus1em
    BodbaoMS3Dm7czOlTY5jTeMk9xiY5eh9s+eXIUfl/nJxuEfrB+2srqroMKSVuQ+CaL+rHU
    lq4IL1xUSk1JUm95IpuNAiPQXM9cur7+2gKmJ/49qsaj74ih8HLjShD5GOWaN0f8XDW6D/
    8BcX0SOat2CWYgGFxn710lns8plwKy7u9BIoZipTeows1WAueRvrtJLgA1oMUohps44gzF
    9209z70PKsLO1Oy6Puwfz1yGuzgj54OqesWYVVF7th3KrFTHsIdrWkLe5hdQDSj5oglz7O
    zGYyJFK7DNA0QgEe0BG+sqXR2pXr4N5OLN90JmDi+6iP2qcvwRzFchhLKDd+0TvBrT2X0A
    2G09QJXgtwxKPIOHNvqqgx8+vX7NG20Kf8KZOngggfuTxcjhuIabmwqzn+9fL+9i0gT+9v
    sXh8G6bDXaglhBsv7LYyTBiE4hwKAk4cdOoS0PJexzF8D87ZOqNUpUhrf6Lw
X-ME-Proxy: <xmx:wE3Jap-T6q28Vjs8RQe9UueYi_OennmDs9TWGIZaG3nljCuI8WE3Lg>
    <xmx:wE3Japbtuzm7DFeJByoE3cG8CYadJiWM8SYEeUq3SFuE5_-NEGPFQQ>
    <xmx:wE3JajfuNbfevU666xHnj9Gxty0A37VCupZrol1i9U4MFPp_s8s6zg>
    <xmx:wE3JammvzR6bRdVvkxyRuXx5KAphaqmKLvXgdsXgmvHHGqdIk_W3XQ>
    <xmx:wU3JauF9yh7Vkbk5u12sT--x1juq_CxFPG9GrDRvjgsVsMIDZf_-8Y0T>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 641A62C00076; Fri,  9 Oct 2026 16:25:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A3wiYYXT56rJ
Date: Fri, 09 Oct 2026 16:25:16 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Armin Wolf" <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>,
 "Navon John Lukose" <navonjohnlukose@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <4ae58ee4-7c9e-4f6c-add4-473cd2a8166a@app.fastmail.com>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-1-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
 <20261009-lwmi-wmi-new-api-v2-1-402828382679@rong.moe>
Subject: Re: [PATCH v2 01/12] platform/wmi: Introduce wmidev_exists()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, Oct 9, 2026, at 8:53 AM, Rong Zhang wrote:
> From: Armin Wolf <W_Armin@gmx.de>
>
> Some WMI drivers need to be able to detect the existence of WMI
> devices matching a given GUID in order to determine the availability
> of optional features. Using wmi_has_guid() for this will not work for
> WMI devices that cannot be used with the legacy GUID-based API (aka
> have WMI_GUID_DUPLICATED set).
>
> Introduce wmidev_exists() that also checks WMI devices that are only
> available to the bus-based API. Also mark wmi_has_guid() as deprecated
> because only WMI drivers using the legacy GUID-based API will continue
> to have use for it.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - New patch in the series as discussed at
>   https://msgid.link/83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe
> ---
>  drivers/platform/wmi/core.c | 33 +++++++++++++++++++++++++++++----
>  include/linux/wmi.h         |  3 +++
>  2 files changed, 32 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..a99da9b7039d 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -145,7 +145,7 @@ static inline void get_acpi_method_name(const 
> struct wmi_block *wblock,
>  	buffer[4] = '\0';
>  }
> 
> -static int wmidev_match_guid(struct device *dev, const void *data)
> +static int wmidev_match_guid_legacy(struct device *dev, const void 
> *data)
>  {
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	const guid_t *guid = data;
> @@ -218,7 +218,7 @@ static struct wmi_device 
> *wmi_find_device_by_guid(const char *guid_string)
>  	if (ret < 0)
>  		return ERR_PTR(ret);
> 
> -	dev = bus_find_device(&wmi_bus_type, NULL, &guid, wmidev_match_guid);
> +	dev = bus_find_device(&wmi_bus_type, NULL, &guid, wmidev_match_guid_legacy);
>  	if (!dev)
>  		return ERR_PTR(-ENODEV);
> 
> @@ -800,10 +800,10 @@ acpi_status wmi_remove_notify_handler(const char *guid)
>  EXPORT_SYMBOL_GPL(wmi_remove_notify_handler);
> 
>  /**
> - * wmi_has_guid - Check if a GUID is available
> + * wmi_has_guid - Check if a GUID is available (deprecated)
>   * @guid_string: 36 char string of the form 
> fa50ff2b-f2e8-45de-83fa-65417f2f49ba
>   *
> - * Check if a given GUID is defined by _WDG.
> + * Check if a given GUID is available and usable with the legacy 
> GUID-based API.
>   *
>   * Return: True if GUID is available, false otherwise.
>   */
> @@ -821,6 +821,31 @@ bool wmi_has_guid(const char *guid_string)
>  }
>  EXPORT_SYMBOL_GPL(wmi_has_guid);
> 
> +static int wmidev_match_guid(struct device *dev, void *data)
> +{
> +	struct wmi_block *wblock = dev_to_wblock(dev);
> +	const guid_t *guid = data;
> +
> +	if (guid_equal(guid, &wblock->gblock.guid))
> +		return 1;
> +
> +	return 0;
> +}
> +
> +/**
> + * wmidev_exists - Check if a WMI device with a given GUID exists
> + * @guid: GUID of the WMI device to search for
> + *
> + * Check if a WMI device with a given GUID exists at the given moment.
> + *
> + * Return: True if a matching WMI device exists, false otherwise.
> + */
> +bool wmidev_exists(const guid_t *guid)
> +{
> +	return bus_for_each_dev(&wmi_bus_type, NULL, (void *)guid, 
> wmidev_match_guid) == 1;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_exists);
> +
>  /**
>   * wmi_get_acpi_device_uid() - Get _UID name of ACPI device that 
> defines GUID (deprecated)
>   * @guid_string: 36 char string of the form 
> fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index defcb624a7e2..3dd223f2ff18 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -13,6 +13,7 @@
>  #include <linux/acpi.h>
>  #include <linux/device-id/wmi.h>
>  #include <linux/types.h>
> +#include <linux/uuid.h>
> 
>  /**
>   * struct wmi_device - WMI device structure
> @@ -83,6 +84,8 @@ acpi_status wmidev_block_set(struct wmi_device *wdev, 
> u8 instance, const struct
> 
>  u8 wmidev_instance_count(struct wmi_device *wdev);
> 
> +bool wmidev_exists(const guid_t *guid);
> +
>  /**
>   * struct wmi_driver - WMI driver structure
>   * @driver: Driver model structure
>
> -- 
> 2.55.0

Tested and confirmed this works.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
