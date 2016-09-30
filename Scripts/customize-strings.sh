#!/bin/bash
# https://github.com/Flipboard/Flipboard-iOS/commit/48393b1a41158fb98ae8fa4e8b36b0ac8ca4715e

declare -a keys=(
"Hated it"
"Loved it"
"Any other feedback? (optional)"
"What's your feedback about our customer support?"
"Sorry to hear that. Could you please tell us a little bit more about the problem you are facing?"
"Email invalid"
"Please enter a brief description of the issue you are facing."
"New message from Support"
"new messages from Support"
)

declare -a de_strings=(
"Nein"
"Ja"
"Ergänzende Kommentare"
"War unser Support hilfreich?"
"Das tut uns leid. Bitte geben Sie uns ein paar Details zu Ihrem Problem."
"Ungültige E-Mail-Adresse"
"Bitte erklären Sie Ihr Problem in kurzen Worten."
"Neue Nachricht vom Support"
"neue Nachrichten vom Support"
)

declare -a en_strings=(
"Poor"
"Awesome!"
"Any other feedback you want to share with us? (optional)"
"Please rate your Support experience with us today"
"Sorry to hear that. Could you please tell us a little bit more about the problem you are having?"
"Invalid email"
"Please enter a brief description of the issue you are having."
"New message from Flipboard Support"
"new messages from Flipboard Support"
)

declare -a es_strings=(
"Mala"
"¡Increíble!"
"¿Tienes alguna sugerencia adicional para ayudarnos a mejorar? (opcional)"
"¿Le gustaría valorar la app?"
"Por favor califica tu experiencia de hoy con nuestro equipo de Soporte"
"Lo sentimos. ¿Nos cuenta un poco más del problema que está teniendo?"
"Dirección de correo electrónico no válida"
"Escriba una breve descripción del problema que está teniendo."
"Nuevo mensaje de apoyo"
"nuevos mensajes de apoyo"
)

declare -a fr_strings=(
"Médiocre"
"Géniale !"
"Avez-vous des commentaires supplémentaires à partager avec nous ? (facultatif)"
"Voulez-vous évaluer l'appli?"
"Veuillez nous faire part de votre expérience avec notre service d'assistance aujourd'hui"
"Nous sommes désolés. Pourriez-vous nous en dire un peu plus au sujet du problème que vous avez rencontré?"
"Adresse courriel non-valide"
"Veuillez écrire une brève description du problème que vous avez rencontré."
"Nouveau message de soutien"
"nouveaux messages de soutien"
)

declare -a it_strings=(
"Scarso"
"Fantastico"
"Hai altri suggerimenti da proporci? (facoltativo)"
"Vorresti recensire la app?"
"Ti chiediamo la cortesia di valutare il nostro servizio di assistenza"
"Siamo molto spiacenti. Puoi fornirci maggiori informazioni sul problema che hai riscontrato?"
"E-mail non valida"
"Inserisci una breve descrizione del problema che hai riscontrato."
"Nuovo messaggio da supporto"
"nuovi messaggi da supporto"
)

declare -a ja_strings=(
"良くない"
"素晴らしい"
"その他のフィードバックはありますか？（オプショナル）"
"アプリを評価しますか？"
"カスタマーサポートの評価をしてください"
"申し訳ございませんが、直面されている問題についてもう少し詳しく教えていただけませんか?"
"メールが無効です"
"直面されている問題を簡単に説明してください。"
"サポートからの新規メッセージ"
"サポートからの新規メッセージ"
)

declare -a ko_strings=(
"별로임"
"최고임"
"다른 피드백이 있으신가요? (선택사항)"
"앱의 리뷰를 작성하시겠습니까?"
"저희 도움말 이용 경험을 평가해 주세요"
"문제가 발생했다니 죄송합니다. 발생한 문제에 대해 좀 더 자세히 설명해주시겠습니까?"
"잘못된 이메일"
"발생한 문제에 대해 간략히 설명해주세요."
"지원팀이 보낸 새 메시지"
"개의 지원팀의 새 메시지"
)

declare -a pt_strings=(
"Ruim"
"Ótimo!"
"Algum comentário ou sugestão que você gostaria de compartilhar conosco? (opcional)"
"Gostaria de fazer uma análise da aplicação?"
"Por favor, avalie o atendimento da nossa equipe de suporte"
"Triste por ouvir isso. Você poderia nos contar um pouco mais sobre o problema que você está enfrentando?"
"E-mail inválido"
"Por favor, digite uma breve descrição do problema que você está enfrentando."
"Nova mensagem de apoio"
"novas mensagens de apoio"
)

declare -a ru_strings=(
"Плохо"
"Отлично!"
"Будем благодарны за дополнительные комментарии"
"Не хотели бы вы оставить отзыв о приложении?"
"Пожалуйста, оцените наш уровень поддержки по шкале"
"Жаль об этом слышать. Не могли бы вы рассказать немного подробнее о проблеме, с которой столкнулись?"
"Некорректная эл.почта"
"Пожалуйста, введите краткое описание проблемы, с которой вы столкнулись."
"Новое сообщение от поддержки"
"новых сообщений от поддержки"
)

declare -a tr_strings=(
"Zayıf"
"Müthiş!"
"Bizimle paylaşmak istediğiniz başka yorumunuz var mı? (isteğe bağlı)"
"Uygulamayı değerlendirmek istiyor musunuz?"
"Lütfen bugün aldığınız desteğin kalitesi için puan verin"
"Bunu duyduğumuza üzüldük. Yaşadığınız sorunla ilgili biraz daha bilgi verebilir misiniz?"
"E-posta geçersiz"
"Lütfen yaşadığınız sorunu kısaca açıklayın."
"Destek'ten yeni mesajınız var"
"Destek'ten yeni mesajlarınız var"
)


localized_files_dir=$1
localized_files_list=$(find $localized_files_dir/* -type d)

locales_cont=0

for dir in $localized_files_list; do


    ## extract locale name from file
    file_name=$(basename "$dir")
    locale_name="${file_name%.*}"

    suffix="_strings"

    ## for each key, find the string from the appropriate strings array index
    i=0
    for key in "${keys[@]}";do
        replace_with_string=$locale_name$suffix[$i]

	## do the replacement with sed. run it in the shell to avoid complexity of escaping single quotes
echo "plutil -replace \"$key\" -string \"${!replace_with_string}\" \"$dir/HelpshiftLocalizable.strings\""
	`plutil -replace "$key" -string "${!replace_with_string}" "$dir/HelpshiftLocalizable.strings"`

	(( i++ ))
    done
    
    (( locales_count++ ))
#    if [ "$locales_count" = "2" ]; then
#    exit
#    fi
done

