From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v3] dmi: Make dmi_walk and dmi_walk_early return real
 error codes
Date: Fri, 22 Jan 2016 10:12:22 +0100
Message-ID: <20160122101222.3a29841d@endymion.delvare>
References: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54600 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751818AbcAVJM0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jan 2016 04:12:26 -0500
In-Reply-To: <0e75e48f9944d14ed914342a4780c199095ad747.1453247603.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy,

Sorry for the delay.

On Tue, 19 Jan 2016 15:54:46 -0800, Andy Lutomirski wrote:
> Currently they return -1 on error, which will confuse callers if
> they try to interpret it as a normal negative error code.
> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
> 
> Changes from v3:

You mean from v2...

>  - Split out from the series it was in.
>  - Use -ENXIO for "there's no DMI".
>  - Also fix docs and !DMI case.
> 
> Changes from v2:

... and from v1.

>  - Total rewrite.
> 
> drivers/firmware/dmi_scan.c | 9 +++++----
>  include/linux/dmi.h         | 2 +-
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> index 0e08e665f715..0418fed261bb 100644
> --- a/drivers/firmware/dmi_scan.c
> +++ b/drivers/firmware/dmi_scan.c
> @@ -144,7 +144,7 @@ static int __init dmi_walk_early(void (*decode)(const struct dmi_header *,
>  
>  	buf = dmi_early_remap(dmi_base, orig_dmi_len);
>  	if (buf == NULL)
> -		return -1;
> +		return -ENOMEM;
>  
>  	dmi_decode_table(buf, decode, NULL);
>  
> @@ -970,7 +970,8 @@ EXPORT_SYMBOL(dmi_get_date);
>   *	@decode: Callback function
>   *	@private_data: Private data to be passed to the callback function
>   *
> - *	Returns -1 when the DMI table can't be reached, 0 on success.
> + *	Returns 0 on success, -ENXIO if DMI is not selected or not present,
> + *	or a different negative error code if DMI walking fails.

Returning an error from DMI walking isn't yet implemented so this is
confusing. If it ever is, most likely it will be implemented as a
separate function. Or were you only referring to the -ENOMEM case below?

>   */
>  int dmi_walk(void (*decode)(const struct dmi_header *, void *),
>  	     void *private_data)
> @@ -978,11 +979,11 @@ int dmi_walk(void (*decode)(const struct dmi_header *, void *),
>  	u8 *buf;
>  
>  	if (!dmi_available)
> -		return -1;
> +		return -ENOENT;

Should be -ENXIO as documented above? Not that I really understand how
"No such device or address" is going to be a helpful error message for
the user. What's wrong with -ENOTSUP I suggested earlier?

>  
>  	buf = dmi_remap(dmi_base, dmi_len);
>  	if (buf == NULL)
> -		return -1;
> +		return -ENOMEM;
>  
>  	dmi_decode_table(buf, decode, private_data);
>  
> diff --git a/include/linux/dmi.h b/include/linux/dmi.h
> index 5055ac34142d..770d548e9a9d 100644
> --- a/include/linux/dmi.h
> +++ b/include/linux/dmi.h
> @@ -135,7 +135,7 @@ static inline int dmi_name_in_vendors(const char *s) { return 0; }
>  static inline int dmi_name_in_serial(const char *s) { return 0; }
>  #define dmi_available 0
>  static inline int dmi_walk(void (*decode)(const struct dmi_header *, void *),
> -	void *private_data) { return -1; }
> +	void *private_data) { return -ENXIO; }
>  static inline bool dmi_match(enum dmi_field f, const char *str)
>  	{ return false; }
>  static inline void dmi_memdev_name(u16 handle, const char **bank,


-- 
Jean Delvare
SUSE L3 Support
