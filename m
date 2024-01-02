Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE7EED9
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBJEx/rA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704199289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kFaCSuEQAMXfgTXcD5gDhV25GDUDM3/9T7C2htOXMrg=;
	b=BBJEx/rAeJYPAz8LUh4g3ExRkwJcspjtyMcVH5qQNbQoGka9jUH4qeWuU8VhuWkRFi4fLd
	uys9BqvO2uv+GfQT76uJq84x2bBWG2yCGmc8e6MpAmAc3cJoNpm30osnGntK3n2m/TzvVU
	dXTZPb9JcPq7ZYgr4l9c/mGVwwGakC8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-WT2RoFY2NCCToN8NIBWb2A-1; Tue, 02 Jan 2024 07:41:23 -0500
X-MC-Unique: WT2RoFY2NCCToN8NIBWb2A-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccc7c01bd7so39408571fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704199281; x=1704804081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFaCSuEQAMXfgTXcD5gDhV25GDUDM3/9T7C2htOXMrg=;
        b=XzrIlv0SKZQtdkNf+Br60+EiXONdUelCRp5cVY/7vaJ83kjBtKIpbjffn9v+s3C2kF
         Oi0FurA9lI8F/gnWLuRBl6/A8JcMnwKXeurgxM8seoGwR/jvqX/ip3T3K52uxkuip/P1
         uOlHJer/uY48HBWo52NIZXH7IyI+niBmBfPGqG6tB6tQYHycIk7vqH4D20Ym1tBPl6aH
         UHdk4UiBpMqMynFQscCp5l+ZQ0BIhG4AxXtZbyOCKSDu9CmaITLM1Zbfpqdw2/1rJh5t
         BMI+aA8Oj9BqlHm9wvHq2UoGhi6zVS2+vx/7R35teZTs7FSb0FUQ4Rn6yhFNPC4LEh4l
         Sy5A==
X-Gm-Message-State: AOJu0YwukmDQz4k4LJip0EOIorha6P2yb1kM9mqjsmIZYJoto2CQzfmB
	TxeTqY1zDGDptHoXaAMUM7hCEPNAYVaPgZUxyxqrapGt2WazoNIOuyH3cv6rAA8jVATiGLJa05U
	vH38n840zlnOqv9wQzal/eg0ThO3dl6qIw37lhWOTwQ==
X-Received: by 2002:a19:e043:0:b0:50d:1e16:59b7 with SMTP id g3-20020a19e043000000b0050d1e1659b7mr6413740lfj.106.1704199281576;
        Tue, 02 Jan 2024 04:41:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFss7kD0JvhGM8Df7C9aYtNfVdAHznAwkpCuM7z/atB9HMUlBNbIwPzLQk+XbIVrK9xQ87W1A==
X-Received: by 2002:a19:e043:0:b0:50d:1e16:59b7 with SMTP id g3-20020a19e043000000b0050d1e1659b7mr6413732lfj.106.1704199281224;
        Tue, 02 Jan 2024 04:41:21 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r9-20020aa7cb89000000b005550844cd1dsm9825716edt.30.2024.01.02.04.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:41:20 -0800 (PST)
Message-ID: <efd6da98-2c11-4bf4-a328-d0f3b28aeb16@redhat.com>
Date: Tue, 2 Jan 2024 13:41:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] platform/x86: Convert to ACPI based probing
Content-Language: en-US, nl
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Suma Hegde <suma.hegde@amd.com>
Cc: platform-driver-x86@vger.kernel.org,
 Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com>
 <20231221172114.1569559-6-suma.hegde@amd.com>
 <19cedcb8-eb39-bee4-fcd4-5d7a375e5ca@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <19cedcb8-eb39-bee4-fcd4-5d7a375e5ca@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suma,

On 12/22/23 09:51, Ilpo Järvinen wrote:
> On Thu, 21 Dec 2023, Suma Hegde wrote:
> 
>> ACPI table provides mailbox base address and register offset
>> information. The base address is provided as part of CRS method
>> and mailbox offsets are provided through DSD table.
>> Sockets are differentiated by UIDs.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> ---
>> Changes since v1:
>> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
>> 2. Add a check to see if mailbox register offsets are set in
>>    hsmp_read_acpi_dsd()
>> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>>    set in hsmp_read_acpi_crs()
>> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
>>    in hsmp_resource()
>> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
>> 6. Add r.end < r.start check in hsmp_resource()
>> 7. Add !dsd error check in hsmp_read_acpi_dsd
>> Changes since v2:
>> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
>> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
>> 3. Use resource_size() in hsmp_resource()
>>
>>  drivers/platform/x86/amd/hsmp.c | 324 +++++++++++++++++++++++++++++---
>>  1 file changed, 296 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
>> index e77d4cd83a07..46924c572055 100644
>> --- a/drivers/platform/x86/amd/hsmp.c
>> +++ b/drivers/platform/x86/amd/hsmp.c
>> @@ -18,9 +18,11 @@
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/semaphore.h>
>> +#include <linux/acpi.h>
>>  
>>  #define DRIVER_NAME		"amd_hsmp"
>> -#define DRIVER_VERSION		"2.0"
>> +#define DRIVER_VERSION		"2.2"
>> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>>  
>>  /* HSMP Status / Error codes */
>>  #define HSMP_STATUS_NOT_READY	0x00
>> @@ -54,6 +56,11 @@
>>  
>>  #define HSMP_ATTR_GRP_NAME_SIZE	10
>>  
>> +/* These are the strings specified in ACPI table */
>> +#define MSG_IDOFF_STR		"MsgIdOffset"
>> +#define MSG_ARGOFF_STR		"MsgArgOffset"
>> +#define MSG_RESPOFF_STR		"MsgRspOffset"
>> +
>>  struct hsmp_mbaddr_info {
>>  	u32 base_addr;
>>  	u32 msg_id_off;
>> @@ -66,6 +73,7 @@ struct hsmp_socket {
>>  	struct bin_attribute hsmp_attr;
>>  	struct hsmp_mbaddr_info mbinfo;
>>  	void __iomem *metric_tbl_addr;
>> +	void __iomem *virt_base_addr;
>>  	struct semaphore hsmp_sem;
>>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
>>  	struct pci_dev *root;
>> @@ -78,12 +86,14 @@ struct hsmp_plat_device {
>>  	struct hsmp_socket *sock;
>>  	u32 proto_ver;
>>  	u16 num_sockets;
>> +	bool is_acpi_device;
>> +	bool is_probed;
>>  };
>>  
>>  static struct hsmp_plat_device plat_dev;
>>  
>> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>> -			 u32 *value, bool write)
>> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>> +			     u32 *value, bool write)
>>  {
>>  	int ret;
>>  
>> @@ -101,8 +111,29 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>>  	return ret;
>>  }
>>  
>> +static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>> +			       u32 *value, bool write)
>> +{
>> +	if (write)
>> +		iowrite32(*value, sock->virt_base_addr + offset);
>> +	else
>> +		*value = ioread32(sock->virt_base_addr + offset);
>> +}
>> +
>> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>> +			 u32 *value, bool write)
>> +{
>> +	if (plat_dev.is_acpi_device)
>> +		amd_hsmp_acpi_rdwr(sock, offset, value, write);
>> +	else
>> +		return amd_hsmp_pci_rdwr(sock, offset, value, write);
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>> - * Send a message to the HSMP port via PCI-e config space registers.
>> + * Send a message to the HSMP port via PCI-e config space registers
>> + * or by writing to MMIO space.
>>   *
>>   * The caller is expected to zero out any unused arguments.
>>   * If a response is expected, the number of response words should be greater than 0.
>> @@ -450,6 +481,9 @@ static int hsmp_create_sysfs_interface(void)
>>  	int ret;
>>  	u16 i;
>>  
>> +	if (plat_dev.is_acpi_device)
>> +		return 0;
> 
> This comes out of nowhere... Why proto_ver isn't enough to handle this?
> If it's needed, would the check perhaps belong to 
> hsmp_is_sock_attr_visible() instead?
> 
>>  	/* String formatting is currently limited to u8 sockets */
>>  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>>  		return -ERANGE;
>> @@ -487,13 +521,188 @@ static int hsmp_create_sysfs_interface(void)
>>  	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>>  }
>>  
>> -static int hsmp_cache_proto_ver(void)
>> +/* This is the UUID used for HSMP */
>> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
>> +						0xa6, 0x9f, 0x4e, 0xa2,
>> +						0x87, 0x1f, 0xc2, 0xf6);
>> +
>> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
>> +{
>> +	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == 16)
> 
> 16 -> UUID_SIZE.

Please submit a v4 addressing Ilpo's review remarks on this patch.

And while at it please also fix the subject-prefix to be:

platform/x86/amd/hsmp: 

As suggested by Thomas.

There have been a bunch of drivers/platform/x86/amd changes merged
recently, please base your v4 on top of:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

to avoid conflicts.

Regards,

Hans


