From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: peaq-wmi: switch to using polled mode of
 input devices
Date: Tue, 1 Oct 2019 22:13:53 +0300
Message-ID: <CAHp75VedN8BCgkFHx599LRU-mFqm451Lz5OJtOU_x5rQWMSKPQ@mail.gmail.com>
References: <20191001185822.GA48020@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001185822.GA48020@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 1, 2019 at 9:58 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We have added polled mode to the normal input devices with the intent of
> retiring input_polled_dev. This converts peaq-wmi driver to use the
> polling mode of standard input devices and removes dependency on
> INPUT_POLLDEV.
>
> Because the new polling coded does not allow peeking inside the poller
> structure to get the poll interval, we change the "debounce" process to
> operate on the time basis, instead of counting events.
>
> We also fix error handling during initialization, as previously we leaked
> input device structure when we failed to register it.

>         if (obj.type != ACPI_TYPE_INTEGER) {
> -               dev_err(&peaq_poll_dev->input->dev,
> +               dev_err(&input_dev->dev,
>                         "Error WMBC did not return an integer\n");

It seems it can be one line now.

>                 return;
>         }

-- 
With Best Regards,
Andy Shevchenko
