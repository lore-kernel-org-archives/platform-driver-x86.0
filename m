Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58B7D5FE
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MkAbBJTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702902869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KYJAg0AeHuFIwLz3shLTLOeN+IYx5mEy87+yZGZuc/s=;
	b=MkAbBJTFVsFUan8dqKw/HUDs7nG6tyOrh0wWVSpu8TbutGsuouy3UJiYFkW0PeRSJ/20r4
	r7MF1PsO/RQ81X4j864sHAcpGMGN95zo0DQFmm7SWPGV2/mzTtL04isPPpnGPaRatkO6lu
	52FtZTYtX89JIDvy8XSd0xA9g8VFBIY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-8HRGdMKqOEm0imQn7sc8Qw-1; Mon, 18 Dec 2023 07:34:27 -0500
X-MC-Unique: 8HRGdMKqOEm0imQn7sc8Qw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a0c510419caso158968466b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 04:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702902866; x=1703507666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYJAg0AeHuFIwLz3shLTLOeN+IYx5mEy87+yZGZuc/s=;
        b=qvrx3L1tPH0rQLDxvS2VAAvz1GfuLmCG3XFZwZ+74oU2967OwernKXa8JGUcFo9P/i
         KG4CujQ26g0/M7ScBC8h2ozxhXhTbZ8jYbDozpyKeZMBVR2TYkiVIvtpZD/+cHUl3zpK
         ra2yMK4/Yg+P5M/BNP4ELphwH4ftiMmTnojO5S86oFNErJjvXresSqA2bU/E2iacbNq2
         oG5ky9OmRIg6kN2/rQwjCxNi89h9tYS0mYhBByU3als1Q0msdGMXCJxZyFr4fqRpn0FX
         a1CSVZXNwwgJ5ZVo77CQtudBBqWBy/xWpy7ow8MStBGd6ehqXdyL2XbQxg63y66Re87P
         KsDg==
X-Gm-Message-State: AOJu0Yya1J9kXgz8B9gKymHoOKb64SrpCsMJB/6FornGRQohOj/zR9zN
	v43Q44hK09i+y9r8gg3EdE3GROAVdYSc23FhHtlvbaOJaHdB029URI26DuEo6eqj2KvD1pjhKR1
	2pLf/ZMJabLZAMRa6NrFwNo+1gfWBl/9ceA==
X-Received: by 2002:a17:906:208d:b0:a23:37b1:610a with SMTP id 13-20020a170906208d00b00a2337b1610amr1199105ejq.38.1702902866427;
        Mon, 18 Dec 2023 04:34:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0lzrFmzpmk7vZhvfVodKyA6YV6QTwfCDLv3Y/1hfgZ25NpdY+s/y/cz+3oPCYMutShfMeiA==
X-Received: by 2002:a17:906:208d:b0:a23:37b1:610a with SMTP id 13-20020a170906208d00b00a2337b1610amr1199095ejq.38.1702902866119;
        Mon, 18 Dec 2023 04:34:26 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id tn9-20020a170907c40900b00a1f7ab65d3fsm12959752ejc.131.2023.12.18.04.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 04:34:25 -0800 (PST)
Message-ID: <e2bda076-1b03-4ba1-adf4-ca7826967f87@redhat.com>
Date: Mon, 18 Dec 2023 13:34:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] platform/x86: Cache pci_dev in struct hsmp_socket
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-3-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-3-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> Cache pci_dev obj during probe as part of struct hsmp_socket
> and use in amd_hsmp_rdwr(). This change will make it easier to
> support both non-ACPI and ACPI devices.
> 
> Also add a check for sock_index agsint number of sockets
> in the hsmp_send_message().
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp.c | 43 +++++++++++++++++++--------------
>  1 file changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 3c17b488f4f8..62a274c84f25 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -58,6 +58,7 @@ struct hsmp_socket {
>  	void __iomem *metric_tbl_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
> +	struct pci_dev *root;
>  	u16 sock_ind;
>  };
>  
> @@ -71,17 +72,20 @@ struct hsmp_plat_device {
>  
>  static struct hsmp_plat_device plat_dev;
>  
> -static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 address,
>  			 u32 *value, bool write)
>  {
>  	int ret;
>  
> -	ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
> +	if (!sock->root)
> +		return -ENODEV;
> +
> +	ret = pci_write_config_dword(sock->root, HSMP_INDEX_REG, address);
>  	if (ret)
>  		return ret;
>  
> -	ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
> -		     : pci_read_config_dword(root, HSMP_DATA_REG, value));
> +	ret = (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *value)
> +		     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
>  
>  	return ret;
>  }
> @@ -95,7 +99,7 @@ static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
>   * Returns 0 for success and populates the requested number of arguments.
>   * Returns a negative error code for failure.
>   */
> -static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
> +static int __hsmp_send_message(struct hsmp_socket *sock, struct hsmp_message *msg)
>  {
>  	unsigned long timeout, short_sleep;
>  	u32 mbox_status;
> @@ -104,7 +108,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>  
>  	/* Clear the status register */
>  	mbox_status = HSMP_STATUS_NOT_READY;
> -	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
> +	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d clearing mailbox status register\n", ret);
>  		return ret;
> @@ -113,7 +117,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>  	index = 0;
>  	/* Write any message arguments */
>  	while (index < msg->num_args) {
> -		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
> +		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
>  				    &msg->args[index], HSMP_WR);
>  		if (ret) {
>  			pr_err("Error %d writing message argument %d\n", ret, index);
> @@ -123,7 +127,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>  	}
>  
>  	/* Write the message ID which starts the operation */
> -	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
> +	ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
>  	if (ret) {
>  		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>  		return ret;
> @@ -140,7 +144,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>  	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>  
>  	while (time_before(jiffies, timeout)) {
> -		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
> +		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading mailbox status\n", ret);
>  			return ret;
> @@ -175,7 +179,7 @@ static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>  	 */
>  	index = 0;
>  	while (index < msg->response_sz) {
> -		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
> +		ret = amd_hsmp_rdwr(sock, SMN_HSMP_MSG_DATA + (index << 2),
>  				    &msg->args[index], HSMP_RD);
>  		if (ret) {
>  			pr_err("Error %d reading response %u for message ID:%u\n",
> @@ -208,21 +212,20 @@ static int validate_message(struct hsmp_message *msg)
>  
>  int hsmp_send_message(struct hsmp_message *msg)
>  {
> -	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
> -	struct amd_northbridge *nb;
> +	struct hsmp_socket *sock;
>  	int ret;
>  
>  	if (!msg)
>  		return -EINVAL;
> -
> -	nb = node_to_amd_nb(msg->sock_ind);
> -	if (!nb || !nb->root)
> -		return -ENODEV;
> -
>  	ret = validate_message(msg);
>  	if (ret)
>  		return ret;
>  
> +	if (!plat_dev.sock || msg->sock_ind >= plat_dev.num_sockets)
> +		return -ENODEV;
> +	sock = &plat_dev.sock[msg->sock_ind];
> +	if (!sock)
> +		return -ENODEV;

You have already checked that plat_dev.sock != NULL so sock
will always be non NULL here and this check is redundant.

Please drop the "if (!sock)" check.

Otherwise this looks good so with that fixed this is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


>  	/*
>  	 * The time taken by smu operation to complete is between
>  	 * 10us to 1ms. Sometime it may take more time.
> @@ -233,7 +236,7 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = __hsmp_send_message(nb->root, msg);
> +	ret = __hsmp_send_message(sock, msg);
>  
>  	up(&sock->hsmp_sem);
>  
> @@ -500,6 +503,10 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
>  		plat_dev.sock[i].sock_ind = i;
>  
> +		if (!node_to_amd_nb(i))
> +			return -ENODEV;
> +		plat_dev.sock[i].root = node_to_amd_nb(i)->root;
> +
>  		/* Test the hsmp interface on each socket */
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {

