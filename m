From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Enable Dell All-In-One volume up/down keys
Date: Wed, 16 Feb 2011 23:52:56 -0800
Message-ID: <20110217075256.GB19814@core.coreip.homeip.net>
References: <1297688524-26123-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:44313 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753663Ab1BQHxF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Feb 2011 02:53:05 -0500
Content-Disposition: inline
In-Reply-To: <1297688524-26123-1-git-send-email-colin.king@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Colin King <colin.king@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, linux-kernel@vger.kernel.org

Hi Colin,

On Mon, Feb 14, 2011 at 01:02:04PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Enable volume up and down hotkeys on WMI events
> GUID 284A0E6B-380E-472A-921F-E52786257FB and
> GUID 02314822-307C-4F66-bf0E-48AEAEB26CC8.
> 
> Also works around a firmware bug where the _WED method
> should return an integer containing the key code and in fact
> the method returns the key code in element zero of a buffer.
> 
> BugLink: http://bugs.launchpad.net/bugs/701530
> BugLink: http://bugs.launchpad.net/bugs/676997

Looks generally good, one question though - should't it be part of
dell-wmi driver?

> +config DELL_WMI_AIO
> +       tristate "WMI Hotkeys for Dell All-In-One series"
> +       depends on ACPI_WMI
> +       depends on INPUT

select INPUT_SPARSEKMAP

> +
> +#define AIO_PREFIX	"dell-wmi-aio: "

Just use

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

and drop AIO_PREFIX from messages.

> +
> +MODULE_DESCRIPTION("WMI hotkeys driver for Dell All-In-One series");
> +MODULE_LICENSE("GPL");
> +
> +#define EVENT_GUID1 "284A0E6B-380E-472A-921F-E52786257FB4"
> +#define EVENT_GUID2 "02314822-307C-4F66-BF0E-48AEAEB26CC8"
> +
> +static char *dell_wmi_aio_guids[] = {
> +	EVENT_GUID1,
> +	EVENT_GUID2,
> +	NULL
> +};
> +
> +MODULE_ALIAS("wmi:"EVENT_GUID1);
> +MODULE_ALIAS("wmi:"EVENT_GUID2);
> +
> +static struct key_entry dell_wmi_aio_keymap[] = {

const

> +
> +static char *dell_wmi_aio_find(void)
> +{
> +	int i;
> +
> +	for (i = 0; dell_wmi_aio_guids[i] != NULL; i++)
> +		if (wmi_has_guid(dell_wmi_aio_guids[i]))
> +			return dell_wmi_aio_guids[i];
> +
> +	return NULL;
> +}
> +
> +static int __init dell_wmi_aio_init(void)
> +{
> +	int err;
> +	char *guid;
> +
> +	guid = dell_wmi_aio_find();
> +	if (guid) {
> +		err = dell_wmi_aio_input_setup();
> +
> +		if (err)
> +			return err;
> +
> +		err = wmi_install_notify_handler(guid,
> +			dell_wmi_aio_notify, NULL);
> +		if (err) {
> +			input_unregister_device(dell_wmi_aio_input_dev);
> +			pr_err(AIO_PREFIX "Unable to register"
> +			       " notify handler - %d\n", err);

Do not break the strings - 80-columr rule does not apply to messages.

> +			return err;
> +		}
> +	} else
> +		pr_warning(AIO_PREFIX "No known WMI GUID found\n");
> +
> +	return 0;

If you did not find known guid you shold return -ENXIO so that the
driver aborts loading into memory (if it is compiled as a module -
likely).

> +}
> +
> +static void __exit dell_wmi_aio_exit(void)
> +{
> +	char *guid;
> +
> +	guid = dell_wmi_aio_find();

And if you fail loading you do not need to check it here.

> +	if (guid) {
> +		wmi_remove_notify_handler(guid);
> +		input_unregister_device(dell_wmi_aio_input_dev);
> +	}
> +}
> +
> +module_init(dell_wmi_aio_init);
> +module_exit(dell_wmi_aio_exit);

Thanks,

-- 
Dmitry
