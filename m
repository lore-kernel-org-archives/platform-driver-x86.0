From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v5 10/14] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Sat, 7 Oct 2017 09:43:33 +0200
Message-ID: <20171007074333.GC25755@kroah.com>
References: <cover.1507350554.git.mario.limonciello@dell.com>
 <169beca316d562d00dc3dfb45248f42c9dc5d368.1507350554.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38197 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750974AbdJGHnZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Oct 2017 03:43:25 -0400
Content-Disposition: inline
In-Reply-To: <169beca316d562d00dc3dfb45248f42c9dc5d368.1507350554.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Fri, Oct 06, 2017 at 11:59:54PM -0500, Mario Limonciello wrote:
> There are some categories of tokens and SMBIOS calls that it makes
> sense to protect userspace from accessing.  These are calls that
> may write to one time use fields or activate hardware debugging
> capabilities.  They are not intended for general purpose use.
> 
> This same functionality may be be later extended to also intercept
> calls that may cause kernel functionality to get out of sync if
> the same functions are used by other drivers.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 76 ++++++++++++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-smbios.h |  2 +
>  2 files changed, 78 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index 2f90ba5346bc..d1908f159be3 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -32,6 +32,7 @@ struct calling_interface_structure {
>  	struct calling_interface_token tokens[];
>  } __packed;
>  
> +static u32 da_supported_commands;
>  static int da_command_address;
>  static int da_command_code;
>  static int da_num_tokens;
> @@ -45,6 +46,14 @@ struct smbios_device {
>  	int (*call_fn)(struct calling_interface_buffer *);
>  };
>  
> +static u32 token_black[] = {
> +	0x0175, 0x0176, 0x0195, 0x0196, 0x0197, 0x01DC, 0x01DD, 0x027D, 0x027E,
> +	0x027F, 0x0280, 0x0281,	0x0282, 0x0283, 0x0284, 0x02E3, 0x02FF, 0x0300,
> +	0x0301, 0x0302, 0x0325, 0x0326, 0x0332, 0x0333,	0x0334, 0x0335, 0x0350,
> +	0x0363, 0x0368, 0x03F6, 0x03F7, 0x049E, 0x049F, 0x04A0, 0x04A1, 0x04A2,
> +	0x04A3, 0x04E6, 0x04E7, 0x9000, 0x9001
> +};

Any hint as to what these values represent?

>  static LIST_HEAD(smbios_device_list);
>  
>  void dell_smbios_get_smm_address(int *address, int *code)
> @@ -104,6 +113,65 @@ void dell_smbios_unregister_device(struct device *d)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
>  
> +int dell_smbios_call_filter(struct device *d,
> +			    struct calling_interface_buffer *buffer)
> +{
> +	int i;
> +	int j;
> +	u32 t;
> +
> +	/* can't make calls over 30 */
> +	if (buffer->class > 30) {
> +		dev_dbg(d, "buffer->class too big: %d\n", buffer->class);
> +		return -EINVAL;
> +	}
> +
> +	/* supported calls on the particular system */
> +	if (!(da_supported_commands & (1 << buffer->class))) {
> +		dev_dbg(d, "invalid command, supported commands: 0x%8x\n",
> +			da_supported_commands);
> +		return -EINVAL;
> +	}
> +
> +	/* diagonstics, debugging information or write once  */
> +	if ((buffer->class == 01 && buffer->select == 07) ||
> +	    (buffer->class == 06 && buffer->select == 05) ||
> +	    (buffer->class == 11 && buffer->select == 03) ||
> +	    (buffer->class == 11 && buffer->select == 07) ||
> +	    (buffer->class == 11 && buffer->select == 11) ||
> +	     buffer->class == 19) {

A structure of class/select that is not allowed might be easier to
maintain over time, right?

> +		dev_dbg(d, "blacklisted command: %d/%d\n",
> +			buffer->class, buffer->select);
> +		return -EINVAL;
> +	}
> +
> +	/* reading/writing tokens*/
> +	if ((buffer->class == 0 && buffer->select < 3) ||
> +	    (buffer->class == 1 && buffer->select < 3)) {
> +		for (i = 0; i < da_num_tokens; i++) {
> +			if (da_tokens[i].location != buffer->input[0])
> +				continue;
> +			/*blacklist reading and writing these */

"/* " ???

thanks,

greg k-h
