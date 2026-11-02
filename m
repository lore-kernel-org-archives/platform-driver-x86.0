Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793587108;
	b=pXTzlLZlPnR3jsGq2TQi75FPK997Mj0hW1H5WmOAn+BvqnY4MLHq5/BksTaOWUzwca6r
	 6BlB/yuVtjkYSqDDr3sEn/hbjiqragZwXYFqCUc8d9PRkEsFKwvqDeipGu1h0rv8WsURk
	 iqlK6Ss2+LopZ/cUbbRj6fPTEAFPpc5QrzX3Hz2yyB/Hl7+kT1XRkl3M9nM/UEEd7SA/D
	 OzX1i2cXPnzn+1pD5TgZOqj1KkGipAMEkOiNOaSSY0HsKC5dPUQ+V4moQ3A8v95dm4AYI
	 RqfwYLkW6+ipJeKLNaff+yDyMazGC92NDUee6RTNpK6PGq5d2SglH5o3phukQ6B2c0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793587108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
	b=0P7ymdt/rfnB2dqD+v7Rzn5j9boDd3ygOV0H+guNPanFlv9okyrzufVQGya55pc7Dwki
	 u9dIMEu/gTeFhWMoE4R0mnepeHcWYjQ6QYAqNHkOYz/CVbc2o/Ylr9FVw9u7RrK/zAckJ
	 e0LyUq48asQRML/XNel0dTInlJNhZiLJsiOf/ldLfQx6n90wCOIv5Uc8iyHwInejvwHn2
	 RyU4ewH3e/11AZ+Qkv9jjeY0f02OOjj2ZFDSpL+LZLuCQIJbBJw66iO0pZkp65ASNe8KJ
	 8uKy0ro4dDVu4A0yG6jweP7dBu8FzYIjqlt55bBqMKwwqXIPdTTNphz8RLcAmZP6H8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+hWe1Ml;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F59606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 02:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F59606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N+hWe1Ml
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso3277505eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 18:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793587107; x=1794191907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
        b=N+hWe1MlafDCYqV3M+XteIeGel/UGWSbeUJHYdVTi0dg7OLyYPKSN6IJnQQaVQJa72
         nNqekO1OTzXO52OBHnwAR5gxI+gkpqfJNUyueSGTvAeNXkOELfxb8TjA0LrH/u9tRpf9
         lenWamWfan9Oz17tyeD8/L80a17f1lf1AX5FqM4p4h5hUrJu1e+XcfhoulXJgWF2995L
         TDnZq0uXu63+voRXoMIm02Gmuhduh8ZnCgywdoPssQ1kghsotFD0AF5RHe15feAsUD6G
         m2qPMcqf95OZ3gvH4msTsE63FkcTn088ArIX8tu2PusT+yh1deveip/R5bL4c+iR0Qut
         SOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587107; x=1794191907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2PdktGYiGmUQUE4j2/vhDmzI5FqLQts9OK26FAYA0I=;
        b=j6aDwro4i5yhdIQ7JAn2i7UuZ+PUUj8k3tnIfr6UizIEdnbIkT7voykwWZrDvS3OGO
         hz+HpMAWvQzjHVWJHiEeuLoBHTz3YoF1k8DOVGee2+6TV4ORJisjWcjmMeFMm2BrtSfU
         yF88uPrzIdIbEINonkCGQTqvcN9AW5cmkBKUhtExIzGMaBK1DE6tVMaONbUiHGpvBrPP
         neEP8VY+pmeFK+As6N+/bXJy5n4/jap+wimGabxSzTvK1Pja2mPaQcwsqpPRxI3lI52i
         6WFmMyOEtJmYETr0b+jde4zHTnFJoAQJy0PE8oVSEoFBUV2dqB8gA5AY+boqZO1IxHpg
         j+Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzwsNIEazhPJf6rQou88SikxkXenLW0xQPPUY2sfcB3ZzMp/cdk/rw7VE5BI0UufuoWHSasIDZ9M57iEnmyoayFo92h@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZArlhYlQyOM9PrjoHzLEftfrFMZdpi04jFpdclUxBmUzDi3/o
	rSi+3NhQQKK5eLCS0l2G0TmtFMnWhU6pOYI588CnGCrMxdeIc+hhtsER
X-Gm-Gg: AYBFou3bUDB2GN4hp08DbaaJwzo/CNeA5aIvpiK3jXlv6gsLquoMXUyuvpHtUyYAhvc
	Y2DIKZ5sTBVlfSd8aNVMMsPbAhUYiLG3MjnozYp4g7FRdfCLXf3WIhWc7Q3QgTUe5E8f1r+m2/8
	lM/oBry/Sx56TffsELVDQGu82KpE+RbZ/1Lh4x17hjtBJWEOSqoH/TMReBtk0AIS4eAzBXNyTB/
	8HK1xXBh3wwTOGBpSwx5FwOmRzX0rYPWI+/bHqaw6yNQFtKzD3wTvHDMoO7s9bhEyDTjws3uPIi
	R3ewO0qmpicDvY6+MaGJrsoGTYJPfmKv2WXX83f01XTh8GoiJqx2Tgtm64o/gRalz7qgzvDi1tl
	IQJFML33lQlsPDzfbUnQFgY8suox7hbq/X95FgVtmJcg2hjV1FFeQDnEOGG+jNiMFVt7rYLVLPN
	61UOeHwvI3FBfKadjds048QhhMyfSvYxunz76emKIHfBj+UlcareiQXOWsYa+rEhS1rJMY4dO0T
	ZFM90SlUo5MF+kV4ZjdM/g117l3YDwHF50kBC3QRwkLJ4uUjouaUfxMo8fQ5LHl2Q+XLcWOjuRp
	Ow4ZWlqgFOYfeYSXstoqqqsyd+wpbeyVEbqJfLXr9tyNJOFUdObcBT8DOURqMspV8Hs=
X-Received: by 2002:a05:7301:1602:b0:369:f9da:a70f with SMTP id 5a478bee46e88-36a423af719mr11569733eec.17.1793587106767;
        Sun, 01 Nov 2026 18:38:26 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm37000136eec.11.2026.11.01.18.38.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:38:26 -0800 (PST)
Message-ID: <af99559a-d37d-4745-b7b1-69ceac2978ed@gmail.com>
Date: Sun, 1 Nov 2026 18:38:24 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86/amd/hsmp: Move per-socket sysfs
 attributes to common code
To: Erwan Velu <erwanaliasr1@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-2-erwanaliasr1@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261007125908.321186-2-erwanaliasr1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/7/26 05:59, Erwan Velu wrote:

> From: Erwan Velu <e.velu@criteo.com>
>
> The per-socket telemetry attributes (c0_residency_input, ddr_max_bw,
> pwr_current_active_freq_limit, ...) are implemented in acpi.c, so only
> the ACPI driver can expose them, although they are plain HSMP messages
> the platform driver can send as well.
>
> Move them to a new sysfs.c in hsmp_common and export the attribute
> groups as hsmp_sock_groups, so they can be shared by both drivers. The
> ACPI driver keeps exposing them on its socket devices via dev_groups.
>
> No functional change.
>
> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>


Acked-by: Carlos Bilbao <carlos.bilbao@kernel.org>


> ---
>   drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>   drivers/platform/x86/amd/hsmp/acpi.c   | 321 +----------------------
>   drivers/platform/x86/amd/hsmp/hsmp.h   |   1 +
>   drivers/platform/x86/amd/hsmp/sysfs.c  | 338 +++++++++++++++++++++++++
>   4 files changed, 341 insertions(+), 321 deletions(-)
>   create mode 100644 drivers/platform/x86/amd/hsmp/sysfs.c
>
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index ce8342e71f50..21fc1d185550 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,7 +5,7 @@
>   #
>   
>   obj-$(CONFIG_AMD_HSMP)			+= hsmp_common.o
> -hsmp_common-y				:= hsmp.o
> +hsmp_common-y				:= hsmp.o sysfs.o
>   hsmp_common-$(CONFIG_HWMON)		+= hwmon.o
>   obj-$(CONFIG_AMD_HSMP_PLAT)		+= amd_hsmp.o
>   amd_hsmp-y				:= plat.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index ddd7a04ee753..d76979baffa8 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -12,9 +12,6 @@
>   #include <asm/amd/hsmp.h>
>   
>   #include <linux/acpi.h>
> -#include <linux/array_size.h>
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
>   #include <linux/cleanup.h>
>   #include <linux/device.h>
>   #include <linux/dev_printk.h>
> @@ -27,7 +24,6 @@
>   #include <linux/rwsem.h>
>   #include <linux/slab.h>
>   #include <linux/string.h>
> -#include <linux/sysfs.h>
>   #include <linux/topology.h>
>   #include <linux/uuid.h>
>   
> @@ -55,11 +51,6 @@ static struct hsmp_plat_device *hsmp_pdev;
>    */
>   static struct kref hsmp_acpi_sock_kref;
>   
> -struct hsmp_sys_attr {
> -	struct device_attribute dattr;
> -	u32 msg_id;
> -};
> -
>   static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>   			      u32 *value, bool write)
>   {
> @@ -270,252 +261,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>   	return 0;
>   }
>   
> -static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> -					 const struct bin_attribute *bin_attr, char *buf,
> -					 loff_t off, size_t count)
> -{
> -	struct device *dev = container_of(kobj, struct device, kobj);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -
> -	/*
> -	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
> -	 * It can therefore only carry the protocol version 6 metric table
> -	 * (struct hsmp_metric_table).  The larger tables defined from protocol
> -	 * version 7 onwards do not fit; userspace on those systems must read
> -	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
> -	 * Surface the unsupported case here as -EOPNOTSUPP rather than
> -	 * silently truncating the snapshot.
> -	 */
> -	if (hsmp_pdev->proto_ver != HSMP_PROTO_VER6)
> -		return -EOPNOTSUPP;
> -
> -	return hsmp_metric_tbl_read(sock, buf, count);
> -}
> -
> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -					 const struct bin_attribute *battr, int id)
> -{
> -	/*
> -	 * Keep metrics_bin visible on protocol version 7 and later as well,
> -	 * so that userspace which expects the file to exist gets a clear
> -	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
> -	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
> -	 */
> -	if (hsmp_pdev->proto_ver >= HSMP_PROTO_VER6)
> -		return battr->attr.mode;
> -
> -	return 0;
> -}
> -
> -static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> -					     struct attribute *attr, int id)
> -{
> -	return attr->mode;
> -}
> -
> -#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
> -
> -static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data);
> -}
> -
> -#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> -#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> -#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> -#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> -#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> -#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> -#define FMAX_MASK		GENMASK(31, 16)
> -#define FMIN_MASK		GENMASK(15, 0)
> -#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> -#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
> -
> -static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> -}
> -
> -static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> -				     char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
> -}
> -
> -static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
> -					  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
> -}
> -
> -static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu.%lu.%lu\n",
> -			  FIELD_GET(FW_VER_MAJOR_MASK, data),
> -			  FIELD_GET(FW_VER_MINOR_MASK, data),
> -			  FIELD_GET(FW_VER_DEBUG_MASK, data));
> -}
> -
> -static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data[2];
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data[0]);
> -}
> -
> -static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
> -			      char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data[2];
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%u\n", data[1]);
> -}
> -
> -static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
> -}
> -
> -static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
> -				  char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
> -}
> -
> -static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> -				    char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> -}
> -
> -static const char * const freqlimit_srcnames[] = {
> -	"cHTC-Active",
> -	"PROCHOT",
> -	"TDC limit",
> -	"PPT Limit",
> -	"OPN Max",
> -	"Reliability Limit",
> -	"APML Agent",
> -	"HSMP Agent",
> -};
> -
> -static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> -					   char *buf)
> -{
> -	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> -	struct hsmp_socket *sock = dev_get_drvdata(dev);
> -	unsigned int index;
> -	int len = 0;
> -	u16 src_ind;
> -	u32 data;
> -	int ret;
> -
> -	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> -	if (ret)
> -		return ret;
> -
> -	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> -	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> -		if (!src_ind)
> -			break;
> -		if (src_ind & 1)
> -			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> -		src_ind >>= 1;
> -	}
> -	return len;
> -}
> -
>   /*
>    * Bring up one ACPI HSMP socket: parse its ACPI table, run the mailbox
>    * handshake and register its sysfs/hwmon interfaces.
> @@ -572,70 +317,6 @@ static int init_acpi(struct device *dev)
>   	return 0;
>   }
>   
> -static const struct bin_attribute  hsmp_metric_tbl_attr = {
> -	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> -	.read = hsmp_metric_tbl_acpi_read,
> -	.size = sizeof(struct hsmp_metric_table),
> -};
> -
> -static const struct bin_attribute *hsmp_attr_list[] = {
> -	&hsmp_metric_tbl_attr,
> -	NULL
> -};
> -
> -#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> -static struct hsmp_sys_attr hattr_##_name = {		\
> -	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> -	.msg_id = _msg_id,				\
> -}
> -
> -HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> -HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> -HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> -HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> -HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> -HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> -HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
> -HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
> -HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> -	      hsmp_freq_limit_show, 0444);
> -HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> -	      hsmp_freq_limit_source_show, 0444);
> -
> -static struct attribute *hsmp_dev_attr_list[] = {
> -	&hattr_c0_residency_input.dattr.attr,
> -	&hattr_prochot_status.dattr.attr,
> -	&hattr_smu_fw_version.dattr.attr,
> -	&hattr_protocol_version.dattr.attr,
> -	&hattr_cclk_freq_limit_input.dattr.attr,
> -	&hattr_ddr_max_bw.dattr.attr,
> -	&hattr_ddr_utilised_bw_input.dattr.attr,
> -	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> -	&hattr_fclk_input.dattr.attr,
> -	&hattr_mclk_input.dattr.attr,
> -	&hattr_clk_fmax.dattr.attr,
> -	&hattr_clk_fmin.dattr.attr,
> -	&hattr_pwr_current_active_freq_limit.dattr.attr,
> -	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> -	NULL
> -};
> -
> -static const struct attribute_group hsmp_attr_grp = {
> -	.bin_attrs = hsmp_attr_list,
> -	.attrs = hsmp_dev_attr_list,
> -	.is_bin_visible = hsmp_is_sock_attr_visible,
> -	.is_visible = hsmp_is_sock_dev_attr_visible,
> -};
> -
> -static const struct attribute_group *hsmp_groups[] = {
> -	&hsmp_attr_grp,
> -	NULL
> -};
> -
>   static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>   	{ACPI_HSMP_DEVICE_HID, 0},
>   	{}
> @@ -793,7 +474,7 @@ static struct platform_driver amd_hsmp_driver = {
>   	.driver		= {
>   		.name	= DRIVER_NAME,
>   		.acpi_match_table = amd_hsmp_acpi_ids,
> -		.dev_groups = hsmp_groups,
> +		.dev_groups = hsmp_sock_groups,
>   	},
>   };
>   
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 8dbff16a87b1..692721e2e6d3 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -80,6 +80,7 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>   static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>   #endif
>   int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
> +extern const struct attribute_group *hsmp_sock_groups[];
>   
>   /*
>    * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> new file mode 100644
> index 000000000000..b1db3b4d77b9
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP sysfs support
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides the per-socket sysfs attributes of the HSMP interface.
> + */
> +
> +#include <asm/amd/hsmp.h>
> +
> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/sysfs.h>
> +
> +#include "hsmp.h"
> +
> +struct hsmp_sys_attr {
> +	struct device_attribute dattr;
> +	u32 msg_id;
> +};
> +
> +static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> +					 const struct bin_attribute *bin_attr, char *buf,
> +					 loff_t off, size_t count)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +
> +	/*
> +	 * metrics_bin is a sysfs binary attribute and is capped at PAGE_SIZE.
> +	 * It can therefore only carry the protocol version 6 metric table
> +	 * (struct hsmp_metric_table).  The larger tables defined from protocol
> +	 * version 7 onwards do not fit; userspace on those systems must read
> +	 * the snapshot through HSMP_IOCTL_GET_TELEMETRY_DATA on /dev/hsmp.
> +	 * Surface the unsupported case here as -EOPNOTSUPP rather than
> +	 * silently truncating the snapshot.
> +	 */
> +	if (get_hsmp_pdev()->proto_ver != HSMP_PROTO_VER6)
> +		return -EOPNOTSUPP;
> +
> +	return hsmp_metric_tbl_read(sock, buf, count);
> +}
> +
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +					 const struct bin_attribute *battr, int id)
> +{
> +	/*
> +	 * Keep metrics_bin visible on protocol version 7 and later as well,
> +	 * so that userspace which expects the file to exist gets a clear
> +	 * -EOPNOTSUPP from the read handler instead of -ENOENT, and is
> +	 * pointed at HSMP_IOCTL_GET_TELEMETRY_DATA as the supported path.
> +	 */
> +	if (get_hsmp_pdev()->proto_ver >= HSMP_PROTO_VER6)
> +		return battr->attr.mode;
> +
> +	return 0;
> +}
> +
> +static umode_t hsmp_is_sock_dev_attr_visible(struct kobject *kobj,
> +					     struct attribute *attr, int id)
> +{
> +	return attr->mode;
> +}
> +
> +#define to_hsmp_sys_attr(_attr) container_of(_attr, struct hsmp_sys_attr, dattr)
> +
> +static ssize_t hsmp_msg_resp32_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data);
> +}
> +
> +#define DDR_MAX_BW_MASK		GENMASK(31, 20)
> +#define DDR_UTIL_BW_MASK	GENMASK(19, 8)
> +#define DDR_UTIL_BW_PERC_MASK	GENMASK(7, 0)
> +#define FW_VER_MAJOR_MASK	GENMASK(23, 16)
> +#define FW_VER_MINOR_MASK	GENMASK(15, 8)
> +#define FW_VER_DEBUG_MASK	GENMASK(7, 0)
> +#define FMAX_MASK		GENMASK(31, 16)
> +#define FMIN_MASK		GENMASK(15, 0)
> +#define FREQ_LIMIT_MASK		GENMASK(31, 16)
> +#define FREQ_SRC_IND_MASK	GENMASK(15, 0)
> +
> +static ssize_t hsmp_ddr_max_bw_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_MAX_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_show(struct device *dev, struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_MASK, data));
> +}
> +
> +static ssize_t hsmp_ddr_util_bw_perc_show(struct device *dev, struct device_attribute *attr,
> +					  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(DDR_UTIL_BW_PERC_MASK, data));
> +}
> +
> +static ssize_t hsmp_msg_fw_ver_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu.%lu.%lu\n",
> +			  FIELD_GET(FW_VER_MAJOR_MASK, data),
> +			  FIELD_GET(FW_VER_MINOR_MASK, data),
> +			  FIELD_GET(FW_VER_DEBUG_MASK, data));
> +}
> +
> +static ssize_t hsmp_fclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[0]);
> +}
> +
> +static ssize_t hsmp_mclk_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data[2];
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, data, 2);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", data[1]);
> +}
> +
> +static ssize_t hsmp_clk_fmax_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMAX_MASK, data));
> +}
> +
> +static ssize_t hsmp_clk_fmin_show(struct device *dev, struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FMIN_MASK, data));
> +}
> +
> +static ssize_t hsmp_freq_limit_show(struct device *dev, struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%lu\n", FIELD_GET(FREQ_LIMIT_MASK, data));
> +}
> +
> +static const char * const freqlimit_srcnames[] = {
> +	"cHTC-Active",
> +	"PROCHOT",
> +	"TDC limit",
> +	"PPT Limit",
> +	"OPN Max",
> +	"Reliability Limit",
> +	"APML Agent",
> +	"HSMP Agent",
> +};
> +
> +static ssize_t hsmp_freq_limit_source_show(struct device *dev, struct device_attribute *attr,
> +					   char *buf)
> +{
> +	struct hsmp_sys_attr *hattr = to_hsmp_sys_attr(attr);
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +	unsigned int index;
> +	int len = 0;
> +	u16 src_ind;
> +	u32 data;
> +	int ret;
> +
> +	ret = hsmp_msg_get_nargs(sock->sock_ind, hattr->msg_id, &data, 1);
> +	if (ret)
> +		return ret;
> +
> +	src_ind = FIELD_GET(FREQ_SRC_IND_MASK, data);
> +	for (index = 0; index < ARRAY_SIZE(freqlimit_srcnames); index++) {
> +		if (!src_ind)
> +			break;
> +		if (src_ind & 1)
> +			len += sysfs_emit_at(buf, len, "%s\n", freqlimit_srcnames[index]);
> +		src_ind >>= 1;
> +	}
> +	return len;
> +}
> +
> +static const struct bin_attribute  hsmp_metric_tbl_attr = {
> +	.attr = { .name = HSMP_METRICS_TABLE_NAME, .mode = 0444},
> +	.read = hsmp_metric_tbl_acpi_read,
> +	.size = sizeof(struct hsmp_metric_table),
> +};
> +
> +static const struct bin_attribute *hsmp_attr_list[] = {
> +	&hsmp_metric_tbl_attr,
> +	NULL
> +};
> +
> +#define HSMP_DEV_ATTR(_name, _msg_id, _show, _mode)	\
> +static struct hsmp_sys_attr hattr_##_name = {		\
> +	.dattr = __ATTR(_name, _mode, _show, NULL),	\
> +	.msg_id = _msg_id,				\
> +}
> +
> +HSMP_DEV_ATTR(c0_residency_input, HSMP_GET_C0_PERCENT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(prochot_status, HSMP_GET_PROC_HOT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(smu_fw_version, HSMP_GET_SMU_VER, hsmp_msg_fw_ver_show, 0444);
> +HSMP_DEV_ATTR(protocol_version, HSMP_GET_PROTO_VER, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(cclk_freq_limit_input, HSMP_GET_CCLK_THROTTLE_LIMIT, hsmp_msg_resp32_show, 0444);
> +HSMP_DEV_ATTR(ddr_max_bw, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_max_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_show, 0444);
> +HSMP_DEV_ATTR(ddr_utilised_bw_perc_input, HSMP_GET_DDR_BANDWIDTH, hsmp_ddr_util_bw_perc_show, 0444);
> +HSMP_DEV_ATTR(fclk_input, HSMP_GET_FCLK_MCLK, hsmp_fclk_show, 0444);
> +HSMP_DEV_ATTR(mclk_input, HSMP_GET_FCLK_MCLK, hsmp_mclk_show, 0444);
> +HSMP_DEV_ATTR(clk_fmax, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmax_show, 0444);
> +HSMP_DEV_ATTR(clk_fmin, HSMP_GET_SOCKET_FMAX_FMIN, hsmp_clk_fmin_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_show, 0444);
> +HSMP_DEV_ATTR(pwr_current_active_freq_limit_source, HSMP_GET_SOCKET_FREQ_LIMIT,
> +	      hsmp_freq_limit_source_show, 0444);
> +
> +static struct attribute *hsmp_dev_attr_list[] = {
> +	&hattr_c0_residency_input.dattr.attr,
> +	&hattr_prochot_status.dattr.attr,
> +	&hattr_smu_fw_version.dattr.attr,
> +	&hattr_protocol_version.dattr.attr,
> +	&hattr_cclk_freq_limit_input.dattr.attr,
> +	&hattr_ddr_max_bw.dattr.attr,
> +	&hattr_ddr_utilised_bw_input.dattr.attr,
> +	&hattr_ddr_utilised_bw_perc_input.dattr.attr,
> +	&hattr_fclk_input.dattr.attr,
> +	&hattr_mclk_input.dattr.attr,
> +	&hattr_clk_fmax.dattr.attr,
> +	&hattr_clk_fmin.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit.dattr.attr,
> +	&hattr_pwr_current_active_freq_limit_source.dattr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group hsmp_attr_grp = {
> +	.bin_attrs = hsmp_attr_list,
> +	.attrs = hsmp_dev_attr_list,
> +	.is_bin_visible = hsmp_is_sock_attr_visible,
> +	.is_visible = hsmp_is_sock_dev_attr_visible,
> +};
> +
> +/*
> + * Per-socket attribute groups. Every show/read handler expects the drvdata of
> + * the device carrying the group to be the struct hsmp_socket it reports on.
> + */
> +const struct attribute_group *hsmp_sock_groups[] = {
> +	&hsmp_attr_grp,
> +	NULL
> +};
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
