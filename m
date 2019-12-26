From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] platform/x86: huawei-wmi: Fix a possible NULL deref
Date: Fri, 27 Dec 2019 00:54:18 +0300
Message-ID: <20191226215418.GA3889@kadam>
References: <20191225235841.14393-1-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191225235841.14393-1-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mattias Jacobsson <2pi@mok.nu>, kbuild test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 25, 2019 at 06:58:38PM -0500, Ayman Bagabas wrote:
> We're iterating over a NULL terminated array.

This changelog is kind of messed up.  This is how it looks in context:
https://marc.info/?l=linux-kernel&m=157731837511760&w=2
The subject and the commit message are far apart.  What's wrong with
iterating over a NULL terminated array?  The changelog doesn't say which
variable is NULL.

> 
> Fixes: 1ac9abeb2e5b ("platform/x86: huawei-wmi: Move to platform driver")
> Signed-off-by: Ayman Bagabas <ayman.bagabas@gmail.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index a2d846c4a7ee..42d461eeeff4 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -784,13 +784,13 @@ static const struct wmi_device_id huawei_wmi_events_id_table[] = {
>  static int huawei_wmi_probe(struct platform_device *pdev)
>  {
>  	const struct wmi_device_id *guid = huawei_wmi_events_id_table;
> +	struct input_dev *idev = *huawei_wmi->idev;

This line seems like an unrelated change.  I'm still not sure the
justification for this.  I really hate puzzling over patches to try
figure out why a patch is making changes.

regards,
dan carpenter
