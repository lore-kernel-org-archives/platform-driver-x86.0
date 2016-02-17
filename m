From: Giedrius =?utf-8?Q?Statkevi=C4=8Dius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH][RESEND] asus-nb-wmi: add wapf=4 quirk for ASUS X75VD
Date: Wed, 17 Feb 2016 12:37:38 +0200
Message-ID: <20160217103738.GA1609@tyrael>
References: <4f2df9dab959ad572e08eb7f7fa03220@natalenko.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4f2df9dab959ad572e08eb7f7fa03220@natalenko.name>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: dvhart@infradead.org, corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 17, 2016 at 09:45:05AM +0200, Oleksandr Natalenko wrote:
> Wi-Fi on ASUS X75VD laptop does not work unless asus_nb_wmi module
> is loaded with wapf=4 option. Add quirk for this.
> ---

You forgot Signed-off-by here. Always run your patch through
scripts/checkpatch.pl. Also, I think the format is usually
[PATCH RESEND vX AA/BB] and not [PATCH][RESEND].
