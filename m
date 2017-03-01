From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] eeepc-laptop: Skip unknown key messages 0x50 0x51
Date: Thu, 2 Mar 2017 01:18:29 +0200
Message-ID: <CAHp75VeKXwqi+F7iq=5mDVGkUKJ637+kN_0xM+LFT0H9Wdxvkw@mail.gmail.com>
References: <20170210174837.1078-1-pespin.shar@gmail.com> <CAHp75VfnbO_9gCfYJYCvnE-w=hkYORi+7pL5NpQCVf3UxTYZNw@mail.gmail.com>
 <CAEGpDuaw3uJoxbyOuTWyBodM-JgMd2hSqZUgg_wbyJa+9sJOjw@mail.gmail.com>
 <CAEGpDuZyFrN0CHy-E+FTwgSLfUKbA65ghenmq_fVK2qw1KDiPg@mail.gmail.com>
 <CAHp75Vem5Rxa+Ms5zop2zCHqExQfv9WPufQ6jPdCBpQQh0AN=w@mail.gmail.com>
 <20170223083631.GE18639@dtor-ws> <CAEGpDub7-ou3YJAOxxK-vj9RYNMp5ER752XMFVLdB8zWWisV8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEGpDub7-ou3YJAOxxK-vj9RYNMp5ER752XMFVLdB8zWWisV8Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pau Espin Pedrol <pespin.shar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "dvhart@infradead.org" <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 24, 2017 at 3:01 PM, Pau Espin Pedrol <pespin.shar@gmail.com> wrote:
>>> Dmitry, do we have special events for AC (un)plug? What is the best
>>> approach in your opinion?
>>
>> Not route them through input as they not input events would be the best.
>>
> Is my patch good enough for this or would you recommend doing it another way?

Corentin, do you have any opinion regarding the change?

-- 
With Best Regards,
Andy Shevchenko
