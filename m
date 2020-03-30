From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] platform: x86: Add ACPI driver for ChromeOS
Date: Mon, 30 Mar 2020 17:34:30 +0200
Message-ID: <20200330153430.GA750889@kroah.com>
References: <20200330150617.1132570-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200330150617.1132570-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, groeck@chromium.org, bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org, Collabora Kernel ML <kernel@collabora.com>, vbendeb@chromium.org, andy@infradead.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeremy Soller <jeremy@system76.com>, Jonathan Corbet <corbet@lwn.net>, Krzysztof Kozlowski <krzk@kernel.org>, Mattias Jacobsson <2pi@mok.nu>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Yauhen Kharuzhy <jekhor@gmail.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 30, 2020 at 05:06:17PM +0200, Enric Balletbo i Serra wrote:
> This driver attaches to the ChromeOS ACPI device and then exports the values
> reported by the ACPI in a sysfs directory. These values are not exported
> via the standard ACPI tables, hence a specific driver is needed to do
> it. The ACPI values are presented in the string form (numbers as decimal
> values) or binary blobs, and can be accessed as the contents of the
> appropriate read only files in the standard ACPI devices sysfs directory tree.

Any reason why you didn't send this to the ACPI maintainers and
developer mailing list?

They would be the best ones to review this...

thanks,

greg k-h
