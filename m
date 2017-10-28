From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v11 14/15] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Sat, 28 Oct 2017 06:18:38 -0700
Message-ID: <20171028131838.GA54152@localhost.localdomain>
References: <cover.1508515469.git.mario.limonciello@dell.com>
 <ff059ff32c00694450a38ce0b8b0c2ca9b9bdb24.1508515469.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:45660 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751179AbdJ1NSo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Oct 2017 09:18:44 -0400
Content-Disposition: inline
In-Reply-To: <ff059ff32c00694450a38ce0b8b0c2ca9b9bdb24.1508515469.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

Hi Greg,

Per our chat in Prague, I checked with Mario and there are no pending changes in
the queue for this series. This, v11, is the one to review.

On Fri, Oct 20, 2017 at 12:40:29PM -0500, Mario Limonciello wrote:
> It's important for the driver to provide a R/W ioctl to ensure that
> two competing userspace processes don't race to provide or read each
> others data.
> 
> This userspace character device will be used to perform SMBIOS calls
> from any applications.
> 
> It provides an ioctl that will allow passing the WMI calling
> interface buffer between userspace and kernel space.
> 
> This character device is intended to deprecate the dcdbas kernel module
> and the interface that it provides to userspace.
> 
> To perform an SMBIOS IOCTL call using the character device userspace will
> perform a read() on the the character device.  The WMI bus will provide
> a u64 variable containing the necessary size of the IOCTL buffer.
> 
> The API for interacting with this interface is defined in documentation
> as well as the WMI uapi header provides the format of the structures.
> 
> Not all userspace requests will be accepted.  The dell-smbios filtering
> functionality will be used to prevent access to certain tokens and calls.
> 
> All whitelisted commands and tokens are now shared out to userspace so
> applications don't need to define them in their own headers.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> ---
>  Documentation/ABI/testing/dell-smbios-wmi | 41 ++++++++++++++++++++++++
>  drivers/platform/x86/dell-smbios-wmi.c    | 53 ++++++++++++++++++++++++-------
>  drivers/platform/x86/dell-smbios.h        | 32 ++-----------------
>  include/uapi/linux/wmi.h                  | 47 +++++++++++++++++++++++++++
>  4 files changed, 132 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/ABI/testing/dell-smbios-wmi
> 
> diff --git a/Documentation/ABI/testing/dell-smbios-wmi b/Documentation/ABI/testing/dell-smbios-wmi
> new file mode 100644
> index 000000000000..fc919ce16008
> --- /dev/null
> +++ b/Documentation/ABI/testing/dell-smbios-wmi
> @@ -0,0 +1,41 @@
> +What:		/dev/wmi/dell-smbios
> +Date:		November 2017
> +KernelVersion:	4.15
> +Contact:	"Mario Limonciello" <mario.limonciello@dell.com>
> +Description:
> +		Perform SMBIOS calls on supported Dell machines.
> +		through the Dell ACPI-WMI interface.
> +
> +		IOCTL's and buffer formats are defined in:
> +		<uapi/linux/wmi.h>
> +
> +		1) To perform an SMBIOS call from userspace, you'll need to
> +		first determine the minimum size of the calling interface
> +		buffer for your machine.
> +		Platforms that contain larger buffers can return larger
> +		objects from the system firmware.
> +		Commonly this size is either 4k or 32k.
> +
> +		To determine the size of the buffer read() a u64 dword from
> +		the WMI character device /dev/wmi/dell-smbios.
> +
> +		2) After you've determined the minimum size of the calling
> +		interface buffer, you can allocate a structure that represents
> +		the structure documented above.
> +
> +		3) In the 'length' object store the size of the buffer you
> +		determined above and allocated.
> +
> +		4) In this buffer object, prepare as necessary for the SMBIOS
> +		call you're interested in.  Typically SMBIOS buffers have
> +		"class", "select", and "input" defined to values that coincide
> +		with the data you are interested in.
> +		Documenting class/select/input values is outside of the scope
> +		of this documentation. Check with the libsmbios project for
> +		further documentation on these values.
> +
> +		6) Run the call by using ioctl() as described in the header.
> +
> +		7) The output will be returned in the buffer object.
> +
> +		8) Be sure to free up your allocated object.
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> index d2b8438ea91f..04b0153c9bee 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -30,17 +30,6 @@ struct misc_bios_flags_structure {
>  
>  #define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
>  
> -struct dell_wmi_extensions {
> -	__u32 argattrib;
> -	__u32 blength;
> -	__u8 data[];
> -} __packed;
> -
> -struct dell_wmi_smbios_buffer {
> -	struct calling_interface_buffer std;
> -	struct dell_wmi_extensions ext;
> -} __packed;
> -
>  struct wmi_smbios_priv {
>  	struct dell_wmi_smbios_buffer *buf;
>  	struct list_head list;
> @@ -117,6 +106,41 @@ int dell_smbios_wmi_call(struct calling_interface_buffer *buffer)
>  	return ret;
>  }
>  
> +static long dell_smbios_wmi_filter(struct wmi_device *wdev, unsigned int cmd,
> +				   struct wmi_ioctl_buffer *arg)
> +{
> +	struct wmi_smbios_priv *priv;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case DELL_WMI_SMBIOS_CMD:
> +		mutex_lock(&call_mutex);
> +		priv = dev_get_drvdata(&wdev->dev);
> +		if (!priv) {
> +			ret = -ENODEV;
> +			goto fail_smbios_cmd;
> +		}
> +		memcpy(priv->buf, arg, priv->req_buf_size);
> +		if (dell_smbios_call_filter(&wdev->dev, &priv->buf->std)) {
> +			dev_err(&wdev->dev, "Invalid call %d/%d:%8x\n",
> +				priv->buf->std.class, priv->buf->std.select,
> +				priv->buf->std.input[0]);
> +			ret = -EFAULT;
> +			goto fail_smbios_cmd;
> +		}
> +		ret = run_smbios_call(priv->wdev);
> +		if (ret)
> +			goto fail_smbios_cmd;
> +		memcpy(arg, priv->buf, priv->req_buf_size);
> +fail_smbios_cmd:
> +		mutex_unlock(&call_mutex);
> +		break;
> +	default:
> +		ret = -ENOIOCTLCMD;
> +	}
> +	return ret;
> +}
> +
>  static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  {
>  	struct wmi_smbios_priv *priv;
> @@ -135,6 +159,12 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  	if (!dell_wmi_get_size(&priv->req_buf_size))
>  		return -EPROBE_DEFER;
>  
> +	/* add in the length object we will use internally with ioctl */
> +	priv->req_buf_size += sizeof(u64);
> +	ret = set_required_buffer_size(wdev, priv->req_buf_size);
> +	if (ret)
> +		return ret;
> +
>  	count = get_order(priv->req_buf_size);
>  	priv->buf = (void *)__get_free_pages(GFP_KERNEL, count);
>  	if (!priv->buf)
> @@ -210,6 +240,7 @@ static struct wmi_driver dell_smbios_wmi_driver = {
>  	.probe = dell_smbios_wmi_probe,
>  	.remove = dell_smbios_wmi_remove,
>  	.id_table = dell_smbios_wmi_id_table,
> +	.filter_callback = dell_smbios_wmi_filter,
>  };
>  
>  static int __init init_dell_smbios_wmi(void)
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/dell-smbios.h
> index 23256f79a4b8..138d478d9adc 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -17,23 +17,11 @@
>  #define _DELL_SMBIOS_H_
>  
>  #include <linux/device.h>
> +#include <uapi/linux/wmi.h>
>  
> -/* Classes and selects used in kernel drivers */
> -#define CLASS_TOKEN_READ 0
> -#define CLASS_TOKEN_WRITE 1
> -#define SELECT_TOKEN_STD 0
> -#define SELECT_TOKEN_BAT 1
> -#define SELECT_TOKEN_AC 2
> +/* Classes and selects used only in kernel drivers */
>  #define CLASS_KBD_BACKLIGHT 4
>  #define SELECT_KBD_BACKLIGHT 11
> -#define CLASS_FLASH_INTERFACE 7
> -#define SELECT_FLASH_INTERFACE 3
> -#define CLASS_ADMIN_PROP 10
> -#define SELECT_ADMIN_PROP 3
> -#define CLASS_INFO 17
> -#define SELECT_RFKILL 11
> -#define SELECT_APP_REGISTRATION	3
> -#define SELECT_DOCK 22
>  
>  /* Tokens used in kernel drivers, any of these
>   * should be filtered from userspace access
> @@ -50,24 +38,8 @@
>  #define GLOBAL_MIC_MUTE_ENABLE	0x0364
>  #define GLOBAL_MIC_MUTE_DISABLE	0x0365
>  
> -/* tokens whitelisted to userspace use */
> -#define CAPSULE_EN_TOKEN	0x0461
> -#define CAPSULE_DIS_TOKEN	0x0462
> -#define WSMT_EN_TOKEN		0x04EC
> -#define WSMT_DIS_TOKEN		0x04ED
> -
>  struct notifier_block;
>  
> -/* This structure will be modified by the firmware when we enter
> - * system management mode, hence the volatiles */
> -
> -struct calling_interface_buffer {
> -	u16 class;
> -	u16 select;
> -	volatile u32 input[4];
> -	volatile u32 output[4];
> -} __packed;
> -
>  struct calling_interface_token {
>  	u16 tokenID;
>  	u16 location;
> diff --git a/include/uapi/linux/wmi.h b/include/uapi/linux/wmi.h
> index 7e52350ac9b3..5ff61f2d37ba 100644
> --- a/include/uapi/linux/wmi.h
> +++ b/include/uapi/linux/wmi.h
> @@ -10,6 +10,7 @@
>  #ifndef _UAPI_LINUX_WMI_H
>  #define _UAPI_LINUX_WMI_H
>  
> +#include <linux/ioctl.h>
>  #include <linux/types.h>
>  
>  /* WMI bus will filter all WMI vendor driver requests through this IOC */
> @@ -23,4 +24,50 @@ struct wmi_ioctl_buffer {
>  	__u8	data[];
>  };
>  
> +/* This structure may be modified by the firmware when we enter
> + * system management mode through SMM, hence the volatiles
> + */
> +struct calling_interface_buffer {
> +	__u16 class;
> +	__u16 select;
> +	volatile __u32 input[4];
> +	volatile __u32 output[4];
> +} __packed;
> +
> +struct dell_wmi_extensions {
> +	__u32 argattrib;
> +	__u32 blength;
> +	__u8 data[];
> +} __packed;
> +
> +struct dell_wmi_smbios_buffer {
> +	__u64 length;
> +	struct calling_interface_buffer std;
> +	struct dell_wmi_extensions	ext;
> +} __packed;
> +
> +/* Whitelisted smbios class/select commands */
> +#define CLASS_TOKEN_READ	0
> +#define CLASS_TOKEN_WRITE	1
> +#define SELECT_TOKEN_STD	0
> +#define SELECT_TOKEN_BAT	1
> +#define SELECT_TOKEN_AC		2
> +#define CLASS_FLASH_INTERFACE	7
> +#define SELECT_FLASH_INTERFACE	3
> +#define CLASS_ADMIN_PROP	10
> +#define SELECT_ADMIN_PROP	3
> +#define CLASS_INFO		17
> +#define SELECT_RFKILL		11
> +#define SELECT_APP_REGISTRATION	3
> +#define SELECT_DOCK		22
> +
> +/* whitelisted tokens */
> +#define CAPSULE_EN_TOKEN	0x0461
> +#define CAPSULE_DIS_TOKEN	0x0462
> +#define WSMT_EN_TOKEN		0x04EC
> +#define WSMT_DIS_TOKEN		0x04ED
> +
> +/* Dell SMBIOS calling IOCTL command used by dell-smbios-wmi */
> +#define DELL_WMI_SMBIOS_CMD	_IOWR(WMI_IOC, 0, struct dell_wmi_smbios_buffer)
> +
>  #endif
> -- 
> 2.14.1
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
