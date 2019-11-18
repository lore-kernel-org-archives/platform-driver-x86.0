From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v8 3/8] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
Date: Mon, 18 Nov 2019 21:30:20 +0000
Message-ID: <20191118213020.GH11244@42.do-not-panic.com>
References: <20191115153529.215244-1-hdegoede@redhat.com>
 <20191115153529.215244-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191115153529.215244-4-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 15, 2019 at 04:35:24PM +0100, Hans de Goede wrote:
> This is a preparation patch for adding a new platform fallback mechanism,
> which will have its own enable/disable FW_OPT_xxx option.
> 
> Note this also fixes a typo in one of the re-wordwrapped comments:
> enfoce -> enforce.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
