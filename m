From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 4/8] platform/x86: fujitsu-laptop: move hotkey input
 device setup to a separate function
Date: Wed, 29 Mar 2017 13:12:39 -0700
Message-ID: <20170329201239.GE15472@localhost.localdomain>
References: <20170320093224.18541-1-kernel@kempniu.pl>
 <20170320093224.18541-5-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-5-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 20, 2017 at 10:32:20AM +0100, Michał Kępień wrote:
> Simplify error handling in acpi_fujitsu_laptop_add() by moving code
> responsible for setting up the input device to a separate function.
> 
> Signed-off-by: Michał Kępień <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/fujitsu-laptop.c | 74 ++++++++++++++++++++---------------
>  1 file changed, 43 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index 3483ac37bee5..b1a08d83330b 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c



> @@ -794,7 +834,6 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
>  {
>  	int result = 0;
>  	int state = 0;
> -	struct input_dev *input;
>  	int error;

This patch highlights the odd error handling / return path with the odd mix of
result and error. Not introduced here, but something for a future cleanup
perhaps.

-- 
Darren Hart
VMware Open Source Technology Center
