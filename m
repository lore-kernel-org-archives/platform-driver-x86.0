From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 09:23:21 +0200
Message-ID: <20171005072321.GB25960@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Oct 04, 2017 at 05:48:39PM -0500, Mario Limonciello wrote:
> This userspace character device will be used to perform SMBIOS calls
> from any applications.
> 
> It provides an ioctl that will allow passing the 32k WMI calling
> interface buffer between userspace and kernel space.

{sigh}  Did you really test this?  It feels like it wasn't, due to the
api you are using here.  Did you run it with a 32bit userspace and 64bit
kernel?  32bit kernel/userspace?  How well did your userspace developer
fall down crying when you tried that?  :)

> This character device is intended to deprecate the dcdbas kernel module
> and the interface that it provides to userspace.

At least that driver has a well-documented api to userspace, you are
throwing all of that away here, are you _sure_ you want to do that?
Seems like you just made things much harder.

> It's important for the driver to provide a R/W ioctl to ensure that
> two competing userspace processes don't race to provide or read each
> others data.

The whole goal of this patch is to provide that ioctl, right?  So of
course it is "important" :)

> The API for interacting with this interface is defined in documentation
> as well as a uapi header provides the format of the structures.

Ok, let's _just_ review that api please:

> diff --git a/include/uapi/linux/dell-smbios-wmi.h b/include/uapi/linux/dell-smbios-wmi.h
> new file mode 100644
> index 000000000000..0d0d09b04021
> --- /dev/null
> +++ b/include/uapi/linux/dell-smbios-wmi.h
> @@ -0,0 +1,25 @@
> +#ifndef _UAPI_DELL_SMBIOS_WMI_H_
> +#define _UAPI_DELL_SMBIOS_WMI_H_
> +
> +#include <linux/ioctl.h>
> +#include <linux/wmi.h>
> +
> +struct wmi_calling_interface_buffer {
> +	u16 class;
> +	u16 select;
> +	u32 input[4];
> +	u32 output[4];
> +	u32 argattrib;
> +	u32 blength;
> +	u8 *data;
> +} __packed;

{sigh}

For structures that cross the user/kernel boundry, you _HAVE_ to use the
correct types.  For some things, that is easy, u16 needs to be __u16,
u32 needs to be __u32, but u8*?  Hah, good luck!  Remember what I
mentioned above about 32/64 bit issues?

Why do you need a pointer here at all?  You are providing a huge chunk
of memory to the ioctl, what's the use of a pointer?  How are you
dereferenceing this pointer (remember, it's a userspace pointer, which
you are not saying here, so odds are the kernel code is wrong...)


> +struct wmi_smbios_ioctl {
> +	u32 length;

__u32.

And why not __u64?  Is 32 bits always going to be ok?

> +	struct wmi_calling_interface_buffer *buf;

Another pointer?  2 pointer dereferences in the same ioctl structure?
Crazy, you are wanting to make your life harder than it has to be...


> +};
> +
> +/* only offers on the single instance */
> +#define DELL_WMI_SMBIOS_CMD		WMI_IOWR(0)

I don't understand the comment, please explain it better.

Please sit down and work out your api here, I don't think you have
thought it through properly, given the number of pointers alone.

thanks,

greg k-h
