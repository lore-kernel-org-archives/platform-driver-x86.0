From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6 09/14] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Tue, 10 Oct 2017 18:01:04 +0200
Message-ID: <20171010160104.g4hqc7fjrp5zeg3p@pali>
References: <cover.1507589249.git.mario.limonciello@dell.com>
 <25bf1422d8efbd631f57dcb7dd40865bae729398.1507589249.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <25bf1422d8efbd631f57dcb7dd40865bae729398.1507589249.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Monday 09 October 2017 17:51:47 Mario Limonciello wrote:
>  static void dell_rfkill_query(struct rfkill *rfkill, void *data)
>  {
> -	struct calling_interface_buffer *buffer;
>  	int radio = ((unsigned long)data & 0xF);
>  	int hwswitch;
>  	int status;
>  	int ret;
>  
> -	buffer = dell_smbios_get_buffer();
> -
> -	dell_smbios_send_request(17, 11);
> -	ret = buffer->output[0];
> +	ret = dell_send_request(17, 11, 0, 0, 0, 0);

Basically I do not like function which takes ten numeric parameters.
Before in this code there was just function with 2 parameters, now there
are lot of zero parameters, without information what which parameter
means...

> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index ade248646578..386130811a34 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> +void dell_smbios_get_smm_address(int *address, int *code)
> +{
> +	*address = da_command_address;
> +	*code = da_command_code;
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_get_smm_address);

Should not be this function in dell-smbios-smm driver instead of the
dispatcher? It has in name "smm" and also is specific for smm driver...

> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 90d7e8e55e9b..b74f48d17116 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -641,13 +641,16 @@ static int dell_wmi_events_set_enabled(bool enable)
>  	struct calling_interface_buffer *buffer;
>  	int ret;
>  
> -	buffer = dell_smbios_get_buffer();
> +	buffer = (void *)get_zeroed_page(GFP_KERNEL);

It is still needed to ask for page? Is not enough to allocate memory via
some *alloc function?

> +	buffer->class = 17;
> +	buffer->select = 3;
>  	buffer->input[0] = 0x10000;
>  	buffer->input[1] = 0x51534554;
>  	buffer->input[3] = enable;
> -	dell_smbios_send_request(17, 3);
> -	ret = buffer->output[0];
> -	dell_smbios_release_buffer();
> +	ret = dell_smbios_call(buffer);
> +	if (ret == 0)
> +		ret = buffer->output[0];
> +	free_page((unsigned long)buffer);
>  
>  	return dell_smbios_error(ret);
>  }

-- 
Pali Rohár
pali.rohar@gmail.com
