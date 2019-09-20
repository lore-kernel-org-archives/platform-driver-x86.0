From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/6] platform/x86: huawei-wmi: Add quirks and module
 parameters
Date: Fri, 20 Sep 2019 08:08:12 +0200
Message-ID: <20190920060812.GB473898@kroah.com>
References: <20190920003938.21617-1-ayman.bagabas@gmail.com>
 <20190920003938.21617-3-ayman.bagabas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190920003938.21617-3-ayman.bagabas@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Sinan Kaya <okaya@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Takashi Iwai <tiwai@suse.de>, Stuart Hayes <stuart.w.hayes@gmail.com>, Matan Ziv-Av <matan@svgalib.org>, Hans de Goede <hdegoede@redhat.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Peng Hao <peng.hao2@zte.com.cn>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 19, 2019 at 08:39:07PM -0400, Ayman Bagabas wrote:
> Introduce quirks and module parameters. 3 quirks are added:
> 1. Fixes reporting brightness keys twice since it's already handled by
>    acpi-video.
> 2. Some models need a short delay when setting battery thresholds to
>    prevent a race condition when two processes read/write. (will be used later)
> 3. Matebook X (2017) handles micmute led through the "legacy" interface
>    which is not currently implemented. Use ACPI EC method to control
>    this led. (will be used later)
> 
> 2 module parameters are added to enable this short delay and/or report
>   brightness keys through this driver.

module parameters are a pain to manage and handle over time.  Is there
any way you can "automatically" figure this out, or use a sysfs file
instead?

thanks,

greg k-h
