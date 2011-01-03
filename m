From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] intel_scu_ipc: Utility driver for intel scu ipc
Date: Mon, 3 Jan 2011 10:17:10 +0100
Message-ID: <201101031017.10481.trenn@suse.de>
References: <20101022144318.30569.62307.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35315 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751460Ab1ACJRN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 3 Jan 2011 04:17:13 -0500
In-Reply-To: <20101022144318.30569.62307.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, sreedhara.ds@intel.com

Hi,

seen this a bit late..., one question:

On Friday 22 October 2010 16:43:55 Alan Cox wrote:
> From: Sreedhara DS <sreedhara.ds@intel.com>
> 
> This driver implements ioctl and interfaces with intel scu ipc driver. It
> is used to access pmic/msic registers from user space and firmware update
> utility.
Why is an ioctl used for updating the firmware?
Why isn't request_firmware(..) via:
/lib/firmware/...
used?
Then the firmware could be maintained here:
http://git.kernel.org/?p=linux/kernel/git/dwmw2/linux-firmware.git;a=summary
and no further userspace tools for firmware updating are needed.

Thanks,

   Thomas
> 
> Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
> [Extensive clean up and debug]
> Signed-off-by: Alan Cox <alan@linux.intel.com>
...
> +/**
> + *	scu_ipc_ioctl		-	control ioctls for the SCU
> + *	@fp: file handle of the SCU device
> + *	@cmd: ioctl coce
> + *	@arg: pointer to user passed structure
> + *
> + *	Support the I/O and firmware flashing interfaces of the SCU
> + */
> +static long scu_ipc_ioctl(struct file *fp, unsigned int cmd,
> +							unsigned long arg)
> +{
> +	int ret;
> +	struct scu_ipc_data  data;
> +	void __user *argp = (void __user *)arg;
> +
> +	if (!capable(CAP_SYS_RAWIO))
> +		return -EPERM;
> +
> +	if (cmd == INTE_SCU_IPC_FW_UPDATE) {
> +			u8 *fwbuf = kmalloc(MAX_FW_SIZE, GFP_KERNEL);
> +			if (fwbuf == NULL)
> +				return -ENOMEM;
> +			if (copy_from_user(fwbuf, (u8 *)arg, MAX_FW_SIZE)) {
> +				kfree(fwbuf);
> +				return -EFAULT;
> +			}
> +			ret = intel_scu_ipc_fw_update(fwbuf, MAX_FW_SIZE);
> +			kfree(fwbuf);
> +			return ret;
