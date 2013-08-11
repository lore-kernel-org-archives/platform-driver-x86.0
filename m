From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH 0/1] Platform: x86: chromeos_laptop - convert to
 i2c_driver to handle i915 race
Date: Sun, 11 Aug 2013 15:44:36 -0700
Message-ID: <CANLzEkumGkXfvWNG+MsMV9Vaq=_bywoQF91J39mV3S2jBW1KFg@mail.gmail.com>
References: <1374163091-4750-1-git-send-email-enselic@gmail.com>
	<CANLzEksSsMY2pTYTfGzgntF-i_Kus+WeVPyNzW0U7APcGOv_5g@mail.gmail.com>
	<CAC-DJzL0VzDxCpsdwjugavBhcFUr+kv+iN9D-Yz_tasw=DF75Q@mail.gmail.com>
	<CANLzEkvi7PY7iO+kicCQZaSi7n6mn2JUC3hVVvPJN2LcCLnqKw@mail.gmail.com>
	<CAC-DJz+Q=O9hvj1QoaZkhSZ-e6ueUQHUuMntin=GYdLqwV0VtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAC-DJz+Q=O9hvj1QoaZkhSZ-e6ueUQHUuMntin=GYdLqwV0VtA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Nordholts <enselic@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Olof Johansson <olof@lixom.net>, Yufeng Shen <miletus@chromium.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Martin,


On Sun, Aug 11, 2013 at 12:54 PM, Martin Nordholts <enselic@gmail.com> wrote:
> I get this in dmesg --level err
> (--notime) though
>
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus vga not found on system.
> find_i2c_adapter_num: i2c adapter i915 gmbus panel not found on system.
>
> Personally I don't like getting error messages when the driver works
> as designed. I would prefer to have priority lowered to 'notice' on
> those.

Sounds good to me. I'll make this change.

Thanks again!
Benson

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
