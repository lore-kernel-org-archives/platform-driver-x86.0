Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F23E3DBE
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 18:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775845231; cv=none; b=YpG7Lu7TqEKC5fxWNb7wvyDgMkIuYQFUYxETKgW/oSm5XFqNaQ5mbtijGiTfDArl5jfKNx7X/Mgte4VdeqTxsxF9OEfw+8SZsPgEDPZNuNXNXyNzC087XkXGgeOI6tK12hJk7MSwI2lsQEPNnmMUEt+/EihNY1db0NISLyTP+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775845231; c=relaxed/simple;
	bh=8gTUf8qLge4er3V33TsZ/9lwQVTRno6oIl9rj3f3bAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PtfJIZAv/9aTQTKSYqmVMaBxXMJakQbpdvJ8zlWKgQ8AM+1UYr8KV8qgMvH1kCxpntlSuz3BFKOgtjL19jhhI3LYPlHqXOJYIg7mw3r1bTqny6KK9foAe400xoZjDCBYbHACFmOF2IBx6HIWdS8I3oUarXShjht+rtk1GpNF/5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lDdHGxOW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lDdHGxOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775845226; x=1776450026; i=w_armin@gmx.de;
	bh=NoUJlGV7vTtudWvkyJdgSJ/S4ohvUbhxQYw1x6eic28=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lDdHGxOW4FWUVS3CXPFYRUAtReY0uQMtE7KUypwg89e7lM+h04l4a9hy/sqpHh3E
	 +2YI/tp1ezdjq0VZf8xVsfAacu3PBf6wvkLxY4zk1oLbYtz/6I5Li7FxVZoIXPRvK
	 liUQQRA1ZF6PLbxAJYVG/y9nx3+rWZiUF4XyE6/anzOQImdYtisUKT2m311qleGcf
	 g6GMX6z3mGcmnse4iDKkRwsp7Czmp+fmdJGa50DjhqBdOckbRLM95H/Fe7zfijx25
	 mvOWvO6OLUyGOgXEvDABQAOhknztf+7lB8MsNwkmMIdUlYo7gzGl/O9c8l1GXkbrA
	 ekRk9QDktI6G4SMaAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Ma24s-1vzB5q2d3k-00YtG2; Fri, 10
 Apr 2026 20:20:26 +0200
Message-ID: <362e0ab3-afb7-43f7-b89e-98ab45b4327e@gmx.de>
Date: Fri, 10 Apr 2026 20:20:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] platform/x86: uniwill-laptop: Implement USB-C power
 priority setting
To: Dan Carpenter <error27@gmail.com>,
 Werner Sembach <wse@tuxedocomputers.com>
Cc: platform-driver-x86@vger.kernel.org
References: <adk7pyLVBmmr3-ni@stanley.mountain>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <adk7pyLVBmmr3-ni@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SSVYQ3jmH+svcslmd3jJWsVJ9jKXSjdvuX4s0Q3EPeX8O9gwhLb
 7mqNLElxbh8AksmX5sP+SCiwIN/iHTM1EsMQaYOgcrWXTBFualbcU+cjh1q3priKESgYhBG
 2Krz/pntMtG0VA8HZcTqgBpbSztKohQezbJYSGq+gn7jp9TSz/0uEdsAJQLkQh3MNZmjcb5
 wXFAEWQsnil1n++JF0ejQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z+7/xCgSBsc=;r3RfAFNpRld8uIGAQTIJYseTq5A
 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

Am 10.04.26 um 20:04 schrieb Dan Carpenter:

> Hello Werner Sembach,
>
> Commit 03ae0a0d0973 ("platform/x86: uniwill-laptop: Implement USB-C
> power priority setting") from Mar 24, 2026 (linux-next), leads to the
> following Smatch static checker warning:
>
> 	drivers/platform/x86/uniwill/uniwill-acpi.c:919 usb_c_power_priority_store()
> 	warn: error code type promoted to positive: 'option'
>
> drivers/platform/x86/uniwill/uniwill-acpi.c
>      909 static ssize_t usb_c_power_priority_store(struct device *dev,
>      910                                           struct device_attribute *attr,
>      911                                           const char *buf, size_t count)
>      912 {
>      913         struct uniwill_data *data = dev_get_drvdata(dev);
>      914         enum usb_c_power_priority_options option;
>      915         unsigned int value;
>      916         int ret;
>      917
>      918         option = sysfs_match_string(usb_c_power_priority_text, buf);
> --> 919         if (option < 0)
>
> enums are unsigned in this context so option can't be negative.
>
>      920                 return option;
>      921
>      922         value = usb_c_power_priority_value[option];
>      923
>      924         guard(mutex)(&data->usb_c_power_priority_lock);
>      925
>      926         ret = regmap_update_bits(data->regmap, EC_ADDR_USB_C_POWER_PRIORITY,
>      927                                  USB_C_POWER_PRIORITY, value);
>      928         if (ret < 0)
>      929                 return ret;
>      930
>      931         data->last_usb_c_power_priority_option = option;
>      932
>      933         return count;
>      934 }
>
> This email is a free service from the Smatch-CI project [smatch.sf.net].
>
> regards,
> dan carpenter

Thanks, Ethan already submitted a patch to fix this:

https://lore.kernel.org/platform-driver-x86/177574207482.8529.7240891931349170592.b4-ty@linux.intel.com/T/#t

Thanks,
Armin Wolf

