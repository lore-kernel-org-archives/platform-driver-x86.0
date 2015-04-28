From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 5/6] toshiba_bluetooth: Change BT status message to debug
Date: Tue, 28 Apr 2015 09:36:19 +0200
Message-ID: <87pp6oiu18.fsf@nemi.mork.no>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
	<1430166770-15060-6-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:60109 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753326AbbD1HiS convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Apr 2015 03:38:18 -0400
In-Reply-To: <1430166770-15060-6-git-send-email-coproscefalo@gmail.com> (Azael
	Avalos's message of "Mon, 27 Apr 2015 14:32:49 -0600")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Azael Avalos <coproscefalo@gmail.com> writes:

> The function toshiba_bluetooth_status s currently printing the status
> of the device whenever it is queried, but since the introduction of
> the rfkill poll code, this value will get printed everytime the poll
> occurs.
>
> This patch changes the level of the printed message from info to
> debug, and also adds a few more debug messages printing the
> killswitch, plug and power status of the device as well.
>
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_bluetooth.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/platf=
orm/x86/toshiba_bluetooth.c
> index 9867ccd..93b9688 100644
> --- a/drivers/platform/x86/toshiba_bluetooth.c
> +++ b/drivers/platform/x86/toshiba_bluetooth.c
> @@ -99,7 +99,7 @@ static int toshiba_bluetooth_status(acpi_handle han=
dle)
>  		return -ENXIO;
>  	}
> =20
> -	pr_info("Bluetooth status %llu\n", status);
> +	pr_debug("Bluetooth status %llu\n", status);
> =20
>  	return status;
>  }
> @@ -157,6 +157,10 @@ static int toshiba_bluetooth_sync_status(struct =
toshiba_bluetooth_dev *bt_dev)
>  	bt_dev->plugged =3D (status & BT_PLUGGED_MASK) ? true : false;
>  	bt_dev->powered =3D (status & BT_POWER_MASK) ? true : false;
> =20
> +	pr_debug("killswitch %d\n", bt_dev->killswitch);
> +	pr_debug("plugged %d\n", bt_dev->plugged);
> +	pr_debug("powered %d\n", bt_dev->powered);


Those are terribly generic messages.  I don't think I would have guesse=
d
which device was trying to tell me "powered 1" if I found it in the
logs...

How about using e.g dev_dbg() to get a bit more context here?

You might also want to put all three into a single call, so that they
make a single dynamic debug entry when dynamic debugging is enabled.

And looking at toshiba_bluetooth_status() I see that all callers have a
device. How about propagating the device to be able to use the dev_*
printk's there as well?  Let the device identify itself instead of
having to guess.


Bj=C3=B8rn
