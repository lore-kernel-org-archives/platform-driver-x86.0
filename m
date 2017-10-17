From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 07/17] platform/x86: dell-smbios: only run if proper
 oem string is detected
Date: Tue, 17 Oct 2017 21:03:36 +0200
Message-ID: <20171017190336.iqhzmdsimx4f7mfw@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <255fc4b41a394542d63bf5a958314904e865a273.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <255fc4b41a394542d63bf5a958314904e865a273.1508259916.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 17 October 2017 13:21:51 Mario Limonciello wrote:
> The proper way to indicate that a system is a 'supported' Dell System
> is by the presence of this string in OEM strings.
> 
> Allowing the driver to load on non-Dell systems will have undefined
> results.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
> index e9b1ca07c872..7e779278d054 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -172,8 +172,15 @@ static void __init find_tokens(const struct dmi_header *dm, void *dummy)
>  
>  static int __init dell_smbios_init(void)
>  {
> +	const struct dmi_device *valid;
>  	int ret;
>  
> +	valid = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL);

Are you sure that all Dell machines have exactly this string? IIRC this
smbios interface via SMM is supported by machines back to 2005... Also
in other DMI tables in dell-latop there is e.g. "Dell Inc." or "Dell
Computer Corporation".

> +	if (!valid) {
> +		pr_err("Unable to run on non-Dell system\n");
> +		return -ENODEV;
> +	}
> +
>  	dmi_walk(find_tokens, NULL);
>  
>  	if (!da_tokens)  {

-- 
Pali Rohár
pali.rohar@gmail.com
