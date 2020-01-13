From: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v11 05/10] test_firmware: add support for
 firmware_request_platform
Date: Mon, 13 Jan 2020 15:50:06 +0000
Message-ID: <20200113155006.GC11244@42.do-not-panic.com>
References: <20200111145703.533809-1-hdegoede@redhat.com>
 <20200111145703.533809-6-hdegoede@redhat.com>
 <20200113145328.GA11244@42.do-not-panic.com>
 <54f70265-265b-ad23-7d2d-af0b27ab1475@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-input-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54f70265-265b-ad23-7d2d-af0b27ab1475@redhat.com>
Sender: linux-input-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 13, 2020 at 04:22:36PM +0100, Hans de Goede wrote:
> 
> test_firmware and dropping the mutex calls is better. I will make
> this change for v12 of this series.
> 
> I'll send out a v12 once the remarks from Andy Lutomirski's
> have also been discussed.

Sure, just think twice about loosing the ability to access the
test_firmware pointer from userspace. If you can find value
in extending your tests then keep it, otherwise if its just
to do the actual test in C in the call itself, it makes sense
to avoid it for that test case.

  Luis
