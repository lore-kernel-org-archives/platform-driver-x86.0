From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] platform/x86: wmi: Do not mix pages and kmalloc
Date: Wed, 20 Jun 2018 16:43:14 -0700
Message-ID: <CAGXu5jL4V9sL7Ai1SVTNkg8OE70c6kLJBdqNtj9Z06MOb4zG0g@mail.gmail.com>
References: <20180620213141.GA8957@beast> <20180620233736.GA3250@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180620233736.GA3250@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?TWloYWkgRG9uyJt1?= <mihai.dontu@gmail.com>, Mario.Limonciello@dell.com
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 20, 2018 at 4:37 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Jun 20, 2018 at 02:31:41PM -0700, Kees Cook wrote:
>> The probe handler_data was being allocated with __get_free_pages()
>> for no reason I could find. The error path was using kfree(). Since
>
> v4 of Mario's series used kmalloc:
> https://patchwork.kernel.org/patch/9985827/
>
> This was changed in v10 to use __get_free_pages:
> https://patchwork.kernel.org/patch/10018023/
>
> But... I'm not finding the discussion that led to this change.... Mario,
> do you recall? Something about contiguous memory? We had a similar
> discussion on an earlier series:
>
> https://patchwork.kernel.org/patch/9975277/

FWIW, kmalloc gets you contiguous memory...

But if the reason is found and needs to stay, the probe error path's
kfree() needs to be fixed, and __GFP_COMP needs to be added to the
free page flags.

-Kees

-- 
Kees Cook
Pixel Security
