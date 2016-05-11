From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v3 1/2] dell-smbios: Add a method for more complex SMI
 requests
Date: Wed, 11 May 2016 14:47:56 +0200
Message-ID: <20160511124756.GA3161@eudyptula.hq.kempniu.pl>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> More complex SMI requests can return data that exceeds the 4 32 bit
> arguments that are traditionally part of a request.
>=20
> To support more complex requests, the first input argument can be a
> 32 bit physical address with a buffer properly built in advance.
>=20
> This new method prepares the buffer as the BIOS will look for
> it in these requests.

I guess rephrasing this sentence might improve clarity, e.g.:

    This patch adds a new method which prepares the buffer as required
    by the BIOS and then issues the specified SMI request.

> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 43 ++++++++++++++++++++++++++++=
++++++++++
>  drivers/platform/x86/dell-smbios.h |  2 ++
>  2 files changed, 45 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x8=
6/dell-smbios.c
> index d2412ab..e3bbbb3 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -33,12 +33,14 @@ struct calling_interface_structure {
>  } __packed;
> =20
>  static struct calling_interface_buffer *buffer;
> +static unsigned char *extended_buffer;
>  static DEFINE_MUTEX(buffer_mutex);
> =20
>  static int da_command_address;
>  static int da_command_code;
>  static int da_num_tokens;
>  static struct calling_interface_token *da_tokens;
> +static const char extended_key[4] =3D {'D', 'S', 'C', 'I'};

Is there any reason why you preferred declaring a char array over using
a string literal in the memcpy() call below?

> =20
>  int dell_smbios_error(int value)
>  {
> @@ -92,6 +94,38 @@ void dell_smbios_send_request(int class, int selec=
t)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_send_request);
> =20
> +/* More complex requests are served by sending
> + * a pointer to a pre-allocated buffer
> + * Bytes 0:3 are the size of the return value
> + * Bytes 4:length are the returned value
> + *
> + * The return value is the data of the extended buffer request
> + * The value of length will be updated to the length of the actual
> + * buffer content
> + *
> + */

Nit: could you please format this comment so that it resembles the rest
of the kernel in terms of whitespace placement, i.e.:

 -> /*
     * More complex requests are served by sending
    ...
     * The value of length will be updated to the length of the actual
     * buffer content
 ->  */

> +unsigned char *dell_smbios_send_extended_request(int class, int sele=
ct,
> +						 size_t *length)

Nice touch with length being an in/out parameter, I like it.

> +{
> +	u32 i;
> +	u32 *buffer_length =3D (u32 *)extended_buffer;

Please swap these two lines so that local variable declarations are in
"Reverse Christmas Tree" order.

> +
> +	if (*length < 5 || *length - 4 > PAGE_SIZE)
> +		return NULL;
> +
> +	*buffer_length =3D *length - 4;
> +	for (i =3D 4; i < *length; i +=3D 4)
> +		if (*length - i > 4)
> +			memcpy(&extended_buffer[i], &extended_key, 4);

I guess a comment just before the for loop might be useful for
documenting the format expected by the BIOS, e.g.:

    /*
     * BIOS will reject the buffer with error code -5 if it does not
     * contain repeating "DSCI" strings from byte 4 onward
     */

> +
> +	*length =3D buffer_length[0];

This assignment should be moved below the dell_smbios_send_request()
call as at this point the BIOS hasn't yet had a chance to update the
buffer.

By the way, I think it would be nice to use the dereference operator
here instead of the subscript operator for consistency with a similar
assignment 4 lines earlier.

> +	buffer->input[0] =3D virt_to_phys(extended_buffer);
> +	dell_smbios_send_request(class, select);
> +
> +	return &extended_buffer[4];
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_send_extended_request);
> +
>  struct calling_interface_token *dell_smbios_find_token(int tokenid)
>  {
>  	int i;
> @@ -170,8 +204,16 @@ static int __init dell_smbios_init(void)
>  		goto fail_buffer;
>  	}
> =20
> +	extended_buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32)=
;
> +	if (!extended_buffer) {
> +		ret =3D -ENOMEM;
> +		goto fail_extended_buffer;
> +	}
> +
>  	return 0;
> =20
> +fail_extended_buffer:
> +	kfree(buffer);

Please use free_page() instead, as in dell_smbios_exit().

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
