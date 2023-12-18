Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC4129EC2
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gk/ZnrGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702906407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rJMHXjX1r42Rv0Wj1IUnEmmJs0EyQ5zmLF1k4p7Tmrg=;
	b=gk/ZnrGRnkEGnbOqpnFaJF5BB7llJ4hviK55ezHYjdI3mQUE0buEwxxz6vBJIpMOxIiUjd
	3AXnwiPH/zojgy57TycRbsIlV9Uex8JaFVjcB7amKuphQhCvH/g9LdT3RfhTuG7Wk9YWjK
	w1igfSmP6PuZPjuHa7drJ3CieGI0szI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-LLYBKr7VNDuG9L7kYB-RtA-1; Mon, 18 Dec 2023 08:33:25 -0500
X-MC-Unique: LLYBKr7VNDuG9L7kYB-RtA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5533ba7664cso1233532a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:33:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702906404; x=1703511204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rJMHXjX1r42Rv0Wj1IUnEmmJs0EyQ5zmLF1k4p7Tmrg=;
        b=wIstgQFkB+mHjoi7UBJb8AfiY/G9OGi2w6Bx13Ov3ozKAziLszU3aNwDajsYkJL9wL
         aV/myzHVxWJOJgyiEetCtcRmQdREqC8dkjzJPnGlUskIyucHe3GwjqxIDp1DXbLaCJFm
         OtdznP+00m8/hsuLOr+Bc7rKH9pg8B+ASdiG0LLul9rraxev1Dl5N/gE5RqRxS+fLfh6
         GIBJjQay9vQtV9/fPvGyQWpoTW69nkbtvxDMn8EaTj+WxDhdWYHEVH0ZhSZ/dTKfF6LG
         IiF8CMnjomf9PqtakFVMhobEDHTGNIT1iyy8LVfAAm7+mSsiAwKRVx4nsxKxHt8N63Pi
         jnqQ==
X-Gm-Message-State: AOJu0YyHD2wyDEWtVlPHXS/YVwXoAv0UAGze/Sw8dAf0406TVlo5hPwk
	A4FEs8KfE6UycpcOKUmmh2pZy7f/8DsGwKOx69/OA6xw/UQ2Q3zja38x74lMkxntPFQNIQI+J1z
	yPgBOTZrtKCDpMU4MrQc0uVZcI/eQcsOZGchPPjDNnQ==
X-Received: by 2002:a2e:7a06:0:b0:2cc:744a:d13d with SMTP id v6-20020a2e7a06000000b002cc744ad13dmr676842ljc.6.1702906383961;
        Mon, 18 Dec 2023 05:33:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtw5bxgqy2Gw135BImXmZvWUudrX0MdMGeBeiEXbTLdJsVBd78JZ1qRQkJm8toImLYd16iZg==
X-Received: by 2002:a17:907:2723:b0:a1f:8149:558c with SMTP id d3-20020a170907272300b00a1f8149558cmr14926414ejl.30.1702906363104;
        Mon, 18 Dec 2023 05:32:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id vs4-20020a170907a58400b00a22fb8901c4sm7411071ejc.12.2023.12.18.05.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:32:42 -0800 (PST)
Message-ID: <9fc042d3-9eb9-4560-94d0-35e6e1364115@redhat.com>
Date: Mon, 18 Dec 2023 14:32:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] platform/x86: Define a struct to hold mailbox regs
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-5-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-5-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> Define struct hsmp_mbaddr_info with register offsets and populate
> them during probe, which avoids the usage of macros in core functions.
> 
> During ACPI probe, the same fields can be populated from ACPI table.
> 
> Also move plat dev init to a static function.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

This changes behavior before this change hsmp_test() was
run on all sockets, now it is only run on a single socket.

If that is deliberate then this change needs to be made
in a separate patch before this patch.

If that change is accidental then please fix it in the next
version.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/hsmp.c | 80 ++++++++++++++++++++++-----------
>  1 file changed, 54 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index f0db7a480ace..44b15c1fab6a 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -40,9 +40,10 @@
>   * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
>   * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
>   */
> -#define SMN_HSMP_MSG_ID		0x3B10534
> -#define SMN_HSMP_MSG_RESP	0x3B10980
> -#define SMN_HSMP_MSG_DATA	0x3B109E0
> +#define SMN_HSMP_BASE		0x3B00000
> +#define SMN_HSMP_MSG_ID		0x0010534
> +#define SMN_HSMP_MSG_RESP	0x0010980
> +#define SMN_HSMP_MSG_DATA	0x00109E0
>  
>  #define HSMP_INDEX_REG		0xc4
>  #define HSMP_DATA_REG		0xc8
> @@ -53,8 +54,17 @@
>  
>  #define HSMP_ATTR_GRP_NAME_SIZE	10
>  
> +struct hsmp_mbaddr_info {
> +	u32 base_addr;
> +	u32 msg_id_off;
> +	u32 msg_resp_off;
> +	u32 msg_arg_off;
> +	u32 size;
> +};
> +
>  struct hsmp_socket {
>  	struct bin_attribute hsmp_attr;
> +	struct hsmp_mbaddr_info mbinfo;
>  	void __iomem *metric_tbl_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> @@ -72,7 +82,7 @@ struct hsmp_plat_device {
>  
>  static struct hsmp_plat_device plat_dev;
>  
> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>  			 u32 *value, bool write)
>  {
>  	int ret;
> @@ -80,7 +90,8 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
>  	if (!sock->root)
>  		return -ENODEV;
>  
> -	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG, address);
> +	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> +				     sock->mbinfo.base_addr + offset);
>  	if (ret)
>  		return ret;
>  
> @@ -101,14 +112,17 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
>   */
>  static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
>  {
> +	struct hsmp_mbaddr_info *mbinfo;
>  	unsigned long timeout, short_sleep;
>  	u32 mbox_status;
>  	u32 index;
>  	int ret;
>  
> +	mbinfo = &sock->mbinfo;
> +
>  	/* Clear the status register */
>  	mbox_status = HSMP_STATUS_NOT_READY;
> -	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
> +	ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d clearing mailbox status register\n", ret);
>  		return ret;
> @@ -117,7 +131,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	index = 0;
>  	/* Write any message arguments */
>  	while (index < msg->num_args) {
> -		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
> +		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>  				    &msg->args[index], HSMP_WR);
>  		if (ret) {
>  			pr_err("Error %d writing message argument %d\n", ret, index);
> @@ -127,7 +141,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	}
>  
>  	/* Write the message ID which starts the operation */
> -	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
> +	ret = amd_hsmp_rdwr(sock, mbinfo->msg_id_off, &msg->msg_id, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>  		return ret;
> @@ -144,7 +158,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>  
>  	while (time_before(jiffies, timeout)) {
> -		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
> +		ret = amd_hsmp_rdwr(sock, mbinfo->msg_resp_off, &mbox_status, HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading mailbox status\n", ret);
>  			return ret;
> @@ -179,7 +193,7 @@ static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *ms
>  	 */
>  	index = 0;
>  	while (index < msg->response_sz) {
> -		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
> +		ret = amd_hsmp_rdwr(sock, mbinfo->msg_arg_off + (index << 2),
>  				    &msg->args[index], HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading response %u for message ID:%u\n",
> @@ -488,9 +502,28 @@ static int hsmp_cache_proto_ver(void)
>  	return ret;
>  }
>  
> +static int initialize_platdev(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
> +		if (!node_to_amd_nb(i))
> +			return -ENODEV;
> +		plat_dev.sock[i].root			= node_to_amd_nb(i)->root;
> +		plat_dev.sock[i].sock_ind		= i;
> +		plat_dev.sock[i].mbinfo.base_addr	= SMN_HSMP_BASE;
> +		plat_dev.sock[i].mbinfo.msg_id_off	= SMN_HSMP_MSG_ID;
> +		plat_dev.sock[i].mbinfo.msg_resp_off    = SMN_HSMP_MSG_RESP;
> +		plat_dev.sock[i].mbinfo.msg_arg_off     = SMN_HSMP_MSG_DATA;
> +		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
> +	}
> +
> +	return 0;
> +}
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
> -	int ret, i;
> +	int ret;
>  
>  	plat_dev.sock = devm_kzalloc(&pdev->dev,
>  				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> @@ -499,22 +532,17 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	plat_dev.dev = &pdev->dev;
>  
> -	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
> -		plat_dev.sock[i].sock_ind = i;
> -
> -		if (!node_to_amd_nb(i))
> -			return -ENODEV;
> -		plat_dev.sock[i].root = node_to_amd_nb(i)->root;
> +	ret = initialize_platdev();
> +	if (ret)
> +		return ret;
>  
> -		/* Test the hsmp interface on each socket */
> -		ret = hsmp_test(i, 0xDEADBEEF);
> -		if (ret) {
> -			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> -			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Is HSMP disabled in BIOS ?\n");
> -			return ret;
> -		}
> +	/* Test the hsmp interface */
> +	ret = hsmp_test(0, 0xDEADBEEF);
> +	if (ret) {
> +		pr_err("HSMP test message failed on Fam:%x model:%x\n",
> +		       boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		pr_err("Is HSMP disabled in BIOS ?\n");
> +		return ret;
>  	}
>  
>  	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;

