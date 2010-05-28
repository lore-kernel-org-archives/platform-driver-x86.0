From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [Patch 2/4] intel scu ipc
Date: Fri, 28 May 2010 14:47:17 +0100
Message-ID: <20100528134716.GA25798@srcf.ucam.org>
References: <0AE3E14D83C76F4994657326177D1FF9042CE9F49E@bgsmsx501.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:39524 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753412Ab0E1NrY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 May 2010 09:47:24 -0400
Content-Disposition: inline
In-Reply-To: <0AE3E14D83C76F4994657326177D1FF9042CE9F49E@bgsmsx501.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Ds, Sreedhara" <sreedhara.ds@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Alan Cox <alan@linux.intel.com>

On Fri, May 28, 2010 at 02:10:51PM +0530, Ds, Sreedhara wrote:
> From cfe6eb1f2ea12732f03d4edee85c50ba713a9d36 Mon Sep 17 00:00:00 2001
> From: Sreedhara DS <sreedhara.ds@intel.com>
> Date: Fri, 28 May 2010 13:55:44 +0530
> Subject: [PATCH] changes to work on both moorestown and medfield
>  new pci id added for medfiled
>  return type of ipc_data_readl chnaged from u8 u32

This sounds like a separate bugfix that should be in a different patch.

> -	u8 cbuf[IPC_WWBUF_SIZE] = { '\0' };
> +	u8 cbuf[IPC_WWBUF_SIZE] = { };

Why this change?

> -		for (nc = 0; nc < count; nc++) {
> +		for (nc = 0; nc < count; nc++, offset += 3) {
>  			cbuf[offset] = addr[nc];
>  			cbuf[offset + 1] = addr[nc] >> 8;
>  			if (id != IPC_CMD_PCNTRL_R)
> @@ -201,33 +202,44 @@ static int pwr_reg_rdwr(u16 *addr, u8 *data, u32 count, u32 op, u32 id)
>  				cbuf[offset + 3] = data[nc + 1];
>  				offset += 1;
>  			}
> -			offset += 3;

Again, what does this have to do with the patch description?

>  		/* Workaround: values are read as 0 without memcpy_fromio */
> -		memcpy_fromio(cbuf, ipcdev.ipc_base + IPC_READ_BUFFER, 16);
> -		if (platform == 1) {
> +		memcpy_fromio(cbuf, ipcdev.ipc_base + 0x90, 16);
> +		if (platform == PLATFORM_LANGWELL) {

You've replaced one constant with a define, and replaced another define 
with a constant. That seems a little odd.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
