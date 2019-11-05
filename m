From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v6 11/15] software node: move small properties inline when copying
Date: Wed, 06 Nov 2019 00:42:02 +0100
Message-ID: <47671501.dVG71sAca0@kreacher>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com> <20191023200233.86616-12-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-12-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday, October 23, 2019 10:02:29 PM CET Dmitry Torokhov wrote:
> When copying/duplicating set of properties, move smaller properties that
> were stored separately directly inside property entry structures. We can
> move:
> 
> - up to 8 bytes from U8 arrays
> - up to 4 words
> - up to 2 double words
> - one U64 value
> - one or 2 strings.

Yes, we can do that, but how much of a difference does this really make?

Also, how can one distinguish between a single-value property and an inline
array which this change?  By looking at the length?

> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/base/swnode.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 18a30fb3cc58..49e1108aa4b7 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -280,6 +280,16 @@ static int property_entry_copy_data(struct property_entry *dst,
>  	if (!dst->name)
>  		goto out_free_data;
>  
> +	if (!dst->is_inline && dst->length <= sizeof(dst->value)) {
> +		/* We have an opportunity to move the data inline */
> +		const void *tmp = dst->pointer;
> +
> +		memcpy(&dst->value, tmp, dst->length);
> +		dst->is_inline = true;
> +
> +		kfree(tmp);

This would have been more useful if we had been able to avoid making the
allocation altogether.

> +	}
> +
>  	return 0;
>  
>  out_free_data:
> 
